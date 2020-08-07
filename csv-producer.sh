#!/bin/bash
# This is Team-Rosalind's script for producing csv file 
# Written as part of HackBio 2020 internship 
cat << "EOF"     


c::;,''..'',::ccclloollllc::;''....'',;;
c:;,,''',;::llloddxxxxxxddool:;,'...',;:
c:;''',,;::cloodxxxxxxxxxxdolc:;,''''',;
:;,',,;;;;;:lodxxxxxxxxxxkxdl:,,,;;;''',
;,,;:cc::clodxxxxxxxxkkkxkxxdol:::cc:;,'
,;:coolodooooloodxkkkkkxdolcloddollllc:, 	
;:looodxxo:;,,;cdxkkkkkxoc;,,;cdxdolllc:  	 _____                      ____                 _ _           _ 
:lolloxkkxol:,',:lxOOkdc;,,;:ldxkxdlccll	|_   _|__  __ _ _ __ ___   |  _ \ ___  ___  __ _| (_)_ __   __| |
oolloxkOOkkxl:;:coxOOkxolccldxkOOOkdolll	  | |/ _ \/ _` | '_ ` _ \  | |_) / _ \/ __|/ _` | | | '_ \ / _` |
occldkOOkkkOOko,',,xNX0l,lkOkOkxkkkxoc:c 	  | |  __/ (_| | | | | | | |  _ < (_) \__ \ (_| | | | | | | (_| |
olcoxkOOOkkOOkd;':lxOkdl:dkkkOkkOOkxolcc	  |_|\___|\__,_|_| |_| |_| |_| \_\___/|___/\__,_|_|_|_| |_|\__,_|
ooooxkOOOkkkdlcccoxOOOkdllcldkkkkkxdlccc
ooooodkkOkxoc;,,:oxkOkxo:,';:ldxkxdlcccc
coooodxkkxl:;::coxkkkkkxdc;,,;cdxdolclc;
::lddoddxxdollloxkkkkkkxxolllodddollcc;,
;;:clolloddxxxxkkkkkkkkkkkxdddolccc::,''
:;,,;::::::coxxkkkkkkkkkxxxol:;;;;;,'.''
::;,,,,;;::clodxxxxkkkkkxxdoc::;,,'..'',
cc:;,,'',;:clooddxxxxxxxddolc:,''...'',,
cc::;,'..',,;:cclooddooolc:;,,'.....''',
ccc:;,'.....',,;;:cclc::;;,'.......'''',   


EOF

#python variable. In some systems python can be missing, but python3 is present
PYTHON3=0

#clone github repo to the current directory and goes to the project directory
git clone https://github.com/Team-Rosalind/team-rosalind-project.git && cd team-rosalind-project;

#run your scripts. Output is 1 line csv file
echo "Running compilers for C and C++ files..."
ls *.cpp | parallel g++ -o {.}.cpp-program {};
ls *.C | parallel gcc -o {.}.c-program {};
echo "Running main scripts..."
ls *.jl | parallel "julia {} |awk -F ': ' ' {print \$2} ' |paste -sd ','  > {.}.lines";
if [ "$PYTHON3" -eq 1 ]; then 
	ls *.py | parallel "python3 {} |awk -F ': ' ' {print \$2} ' |paste -sd ','  > {.}.lines";
elif [ "$PYTHON3" -eq 0 ]; then
	ls *.py | parallel "python {} |awk -F ': ' ' {print \$2} ' |paste -sd ','  > {.}.lines";
fi;
ls *.m | parallel "octave {} |awk -F ': ' ' {print \$2} ' |paste -sd ','  > {.}.lines";
ls *.js | parallel "node {} |awk -F ': ' ' {print \$2} ' |paste -sd ','  > {.}.lines";
ls *.R | parallel "Rscript {} |awk -F ': ' ' {print \$2} ' |paste -sd ','  > {.}.lines";
ls *.cpp-program | parallel "./{} |awk -F ': ' ' {print \$2} ' |paste -sd ','  > {.}.lines";
ls *.c-program | parallel "./{} |awk -F ': ' ' {print \$2} ' |paste -sd ','  > {.}.lines";
echo "Running postprocessing of made csv files..."
#for i in *.csv; do echo "" >> $i; done ;
# Removing empty columns from files

for i in *.lines; do cat $i | sed 's/,\s*,/,/g' |sed 's/^,//g' | sed 's/,\s*/,/g' | sed 's/^\s*//g'  > $i.csv; done;

#rm -f *.csv ;
#Merge csvs
echo "Merging csv files...";
#cat *.tsvs > Member_info_team-rosalind.txt;
cat `ls *.csv | paste	-sd '\t'` > Member_info_team-rosalind.txt
#Remove temporary files
echo "Removing temporary files..."
rm -f *.lines ;
rm -f *.csv ;
rm -f *.c-program;
rm -f *.cpp-program ;
#Rename txt file to csv one
echo "Renaming final file..."
# Remove blasnk rows from final file
cat Member_info_team-rosalind.txt | awk -F, 'length>NF+1' > Member_info_team-rosalind.csv;
# Remove temporary file
rm -f Member_info_team-rosalind.txt;
echo "Done!"
echo ""
echo -e "\033[1mPlease consider using Member_info_team-rosalind.csv file in repo directory"
echo ""
