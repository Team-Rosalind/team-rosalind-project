#!/bin/bash


FLAG_EXIT=0
CLONNED_REPO=0
PYTHON3_test=0
PYTHON3=0
FLAG_PYTHON=0
FLAG_BASH=0
COUNTER=0
FLAG_UPDATE=0
PARALLEL_CITATION=0

#Declaring a bunch of arrays. We will need them later
declare -a need_to_install
declare -a pip_install
declare -a packages_versions
declare -a packages_python_names
declare -a to_update

#Here are listed dependencies. Feel free to add any.
checked_programs=(python sed awk parallel julia gcc g++ node octave Rscript)
#Please use "==" for defining versions of python packages!!
python_packages=(pandas==1.1.0 xlrd==1.2.0)

#Actually check if packages are installed in the system by locating their binary
#If binary wasn't found, then this program is not installed in the system
for i in "${checked_programs[@]}"; do
	if ! command -v $i &> /dev/null
	then
		#Check if python is masked under python3. If so, python3 is used for test execution
		if [[ "$i" == "python" ]]; then
			if command -v python3 &> /dev/null
			then 
				echo "python is missing, hence python3 is detected. Please set PYTHON3 variable in csv-producer to the 1"
				PYTHON3_test=1
			fi
		fi
		if [[ "$i" == "parallel" ]]; then 
			$PARALLEL_CITATION=1
		fi;
    	echo "$i is missing in your system"
		#There is no such package as Rscript. We need to install base packages for R
		#Rscript is located in the r-base package. Therefore we change it for install message
    	if [[ "$i" == 'Rscript' ]]; then
    		need_to_install+=(r-base)
    	else
    		need_to_install+=($i)
    	fi;
		#Some logic for python3. For the first iteration we do not change FLAG_EXIT, because all required packages are actually installed.
		#If other iterations if more packages are missing, we change FLAG_EXIT to 1
    	if [[ "$PYTHON3_test" -eq 1 ]]; then
    		FLAG_EXIT=0;
    		PYTHON3_test=0;
    		PYTHON3=1
    	else
    		FLAG_EXIT=1;
			FLAG_BASH=1;
    	fi;
	fi; done;

#Splitting python_packages array into two to check if package is installed (only by name)
#And to check if correct version is installed
for i in "${python_packages[@]}"; do tmp=$(echo $i | awk -F '==' '{print $1}'); packages_python_names+=($tmp) ; done
for i in "${python_packages[@]}"; do tmp=$(echo $i | awk -F '==' '{print $2}'); packages_versions+=($tmp) ; done

#Interating throught names and checking if correcponding python packages are installed
#If package is installed checking the version of the package
for i in "${packages_python_names[@]}"; do
	if ! pip show $i &>/dev/null; then
		echo "$i is missing in your system";
		pip_install+=($i);
        FLAG_EXIT=1;
		FLAG_PYTHON=1;
	else
		#We are storing versions without "." and comparing them. 
		#To automate correct version retrival COUNTER is introduced
		CURRENT_VERSION=$(pip show $i | grep Version | awk -F ': ' '{print $2}' | sed 's/\.//g' )
		NEED_VERSION=$( echo "${packages_versions[$COUNTER]}" |  sed 's/\.//g' )
		if [ $CURRENT_VERSION  -lt  $NEED_VERSION ]; then 
			echo "$i version is lower than suggested ${packages_versions[$COUNTER]}";
			echo "Please update $i"
			to_update+=( ${python_packages[$COUNTER]})
			FLAG_EXIT=1;
			FLAG_UPDATE=1;
			COUNTER+=1;
		fi;
	fi;
done;
#If any of the dependencies were no satisfied go here and print corresponding message
if [[ "$FLAG_EXIT"  -eq 1 ]]; then
	echo "Please satisfy dependencies before running futher tests!"
	#Here we go if bash packages are missing
	if [ "$FLAG_BASH" -eq 1 ]; then
		echo "------------------------------------------------------------------"
		echo "You can use the following command:"
		echo
		echo "For Ubuntu-based system:"
		echo "sudo apt-get ${need_to_install[*]}"
		echo
		echo "For Arch-based:"
		echo "sudo pacman ${need_to_install[*]}"
		echo "NOTE: If g++ was not found, you must only install gcc. g++ is included in that package for arch"
		echo
		echo "For Fedora"
		echo "sudo yum ${need_to_install[*]}"
		echo "------------------------------------------------------------------"
		if [ $PARALLEL_CITATION -eq 1 ]; then
			echo "Please also run the following command after installing parallel:"
			echo "parallel --citation"
			echo "This for silencing parallel behaviour"
		fi;
	fi;
	#This statement is executed if python libraries are missing
	if [ "$FLAG_PYTHON" -eq 1 ]; then
		echo "------------------------------------------------------------------"
		echo
		echo "To satisfy python dependencies please run:"
		echo "pip install ${pip_install[*]}"
		echo
		echo "------------------------------------------------------------------"
	fi;
	#This statement is executed if some libraries are out-of-date
	if [ "$FLAG_UPDATE" -eq 1 ]; then
		echo "------------------------------------------------------------------"
		echo 
		echo "To update packages please use the following command:"
		echo "pip install ${to_update[*]}"
		echo
		echo "------------------------------------------------------------------"
	fi;
	echo -e "\033[1mWhen all dependencies will be satisfied, please run this script one more time!"
	echo
	exit;
fi;

echo "Done!"
echo "All requirements satisfied!"
echo ""
#Cloning repo, if tests folder isn't here
if [ ! -d "tests" ]; then
	echo "tests directory was not found in your system..."
	echo "Clonning our repo..."
	echo ""
	git clone https://github.com/Team-Rosalind/team-rosalind-project.git && cd team-rosalind-project;
	CLONNED_REPO=1
fi;
echo "Running test scripts..."
#Actually executing test scripts. Using parallel for test purposes only, no need to use it to lower execution time.
cd tests;
#If python if missing but python3 is in system test can be run just fine.
#Some systems mask python to python3
if [[ "$PYTHON3" -eq 1 ]]; then 
	ls *.py | parallel "python3 {} |awk -F ': ' ' {print \$2} ' |paste -sd ','  > {.}.csv";
elif [[ "$PYTHON3" -eq 0 ]]; then
	ls *.py | parallel "python {} |awk -F ': ' ' {print \$2} ' |paste -sd ','  > {.}.csv";
fi;
ls *.m | parallel  "octave {} |awk -F ': ' ' {print \$2} ' |paste -sd ',' > {.}.csv";
for i in *.C; do gcc -o $i.c-program $i; done;
ls *.c-program | parallel  "./{} |awk -F ': ' ' {print \$2} ' |paste -sd ',' > {.}.csv";
for i in *.cpp; do g++ -o $i.cpp-program $i; done;
ls *.cpp-program | parallel  "./{} |awk -F ': ' ' {print \$2} ' |paste -sd ',' > {.}.csv";
ls *.R | parallel  "Rscript {} |awk -F ': ' ' {print \$2} ' |paste -sd ',' > {.}.csv";
ls *.jl | parallel  "julia {} |awk -F ': ' ' {print \$2} ' |paste -sd ',' > {.}.csv";
ls *.js | parallel  "node {} |awk -F ': ' ' {print \$2} ' |paste -sd ',' > {.}.csv";
#Remove temporary files
rm -f *.cpp-program;
rm -f *.c-program;
cat *.csv > Tests.txt;
rm -f *.csv && mv Tests.txt test.csv;
#This statement is executed if you are clonning the repo.
#Repo's folder is deleted and test.csv is moved to the tests.sh folder
if [[ "$CLONNED_REPO"  -eq 1 ]]; then
	cd ..;
	cd ..;
	mv team-rosalind-project/tests/test.csv ./;
	echo "Removing created files...";
	rm -rf team-rosalind-project;
	echo "Done!"
	echo ""
	echo "Please check the output from tests in test.csv in your current directory"
	echo "All seven languages must be in the csv file (C, C++, MATLAB, PYTHON, R, JULIA, JAVASCRIPT) and all cells must be filled!"
	echo "Best Regards,"

cat << "EOF"

 _____                      ____                 _ _           _ 
|_   _|__  __ _ _ __ ___   |  _ \ ___  ___  __ _| (_)_ __   __| |
  | |/ _ \/ _` | '_ ` _ \  | |_) / _ \/ __|/ _` | | | '_ \ / _` |
  | |  __/ (_| | | | | | | |  _ < (_) \__ \ (_| | | | | | | (_| |
  |_|\___|\__,_|_| |_| |_| |_| \_\___/|___/\__,_|_|_|_| |_|\__,_|

EOF
#If tests folder is found, then tests,csv is located there. 
elif [[ "$CLONNED_REPO"  -eq 0 ]]; then

echo ""
echo "Please check the output from tests in tests/test.csv"
echo "All seven languages must be in the csv file (C, C++, MATLAB, PYTHON, R, JULIA, JAVASCRIPT) and all cells must be filled!"
echo "Best Regards,"

cat << "EOF"

 _____                      ____                 _ _           _ 
|_   _|__  __ _ _ __ ___   |  _ \ ___  ___  __ _| (_)_ __   __| |
  | |/ _ \/ _` | '_ ` _ \  | |_) / _ \/ __|/ _` | | | '_ \ / _` |
  | |  __/ (_| | | | | | | |  _ < (_) \__ \ (_| | | | | | | (_| |
  |_|\___|\__,_|_| |_| |_| |_| \_\___/|___/\__,_|_|_|_| |_|\__,_|

EOF
fi;