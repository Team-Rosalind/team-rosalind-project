#!/bin/bash



FLAG_EXIT=0
CLONNED_REPO=0
PYTHON3_test=0
PYTHON3=0

declare -a need_to_install

checked_programs=(python sed awk parallel julia gcc g++ node)


for i in "${checked_programs[@]}"; do
	if ! command -v $i &> /dev/null
	then
		if [[ "$i" == "python" ]]; then
			if command -v python3 &> /dev/null
			then 
				echo "python is missing, hence python3 is detected. Please set PYTHON3 variable in csv-producer to the 1"
				PYTHON3_test=1
			fi
		fi
    	echo "$i is missing in your system"
    	need_to_install+=($i)
    	if [[ "$PYTHON3_test" -eq 1 ]]; then 
    		FLAG_EXIT=0;
    		PYTHON3_test=0;
    		PYTHON3=1
    	else
    		FLAG_EXIT=1;
    	fi;
	fi; done;

 

if [[ "$FLAG_EXIT"  -eq 1 ]]; then
	echo "Please satisfy dependencies before running futher tests!"
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
	echo
	echo -e "\033[1mWhen all dependencies will be satisfied, please run this script one more time!"
	echo
	exit;
fi;

echo "Done!"
echo "All requirements satisfied!"
echo ""

if [ ! -d "tests" ]; then
	echo "tests directory was not found in your system..."
	echo "Clonning our repo..."
	echo ""
	git clone https://github.com/Team-Rosalind/team-rosalind-project.git && cd team-rosalind-project;
	CLONNED_REPO=1
fi;
echo "Running test scripts..."
cd tests;
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
rm -f *.cpp-program;
rm -f *.c-program;
cat *.csv > Tests.txt;
rm -f *.csv && mv Tests.txt test.csv;
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