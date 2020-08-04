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

#clone github repo to the current directory and goes to the project directory
git clone https://github.com/Team-Rosalind/team-rosalind-project.git && cd team-rosalind-project;

#run your scripts. Output is 1 line csv file
echo "Running compilers for C and C++ files..."
g++ -o Suritra stage_0_Suritra.cpp;
gcc -o stage_0_Anu stage_0_Anu.C ;
gcc -o stage_0_harinath stage_0_harinath.C ;
echo "Running main scripts..."
julia stage_0_pavlo.jl |  awk -F ": " '/^NAME/ {print ""} {printf "%s,", $2} ' | tail -n +2  > pavlo.csv;
./stage_0_Anu |  awk -F ": " '/^NAME/ {print ""} {printf "%s,", $2} ' | tail -n +2 > Anu.csv;
node stage_0_dolu.js  |  awk -F ": " '/^NAME/ {print ""} {printf "%s,", $2} ' | tail -n +2 > dolu.csv;
python stage_0_hildred.py |  awk -F ": " '/^NAME/ {print ""} {printf "%s,", $2} ' | tail -n +2 > hildred.csv;
Rscript stage_0_shirine.R |  awk -F ": " '/^NAME/ {print ""} {printf "%s,", $2} ' | tail -n +2 > shirine.csv;
./Suritra |  awk -F ": " '/^NAME/ {print ""} {printf "%s,", $2} ' | tail -n +2 > Suritra.csv;
python Stage_0_Leye.py|  awk -F ": " '/^NAME/ {print ""} {printf "%s,", $2} ' | tail -n +2 > Leye.csv;
Rscript Stage_0_Ife.R |  awk -F ": " '/^NAME/ {print ""} {printf "%s,", $2} ' | tail -n +2 > Ife.csv;
./stage_0_harinath | awk -F ": " '/^NAME/ {print ""} {printf "%s,", $2} ' | tail -n +2 > harinath.csv;
python stage_0_rupa.py|  awk -F ": " '/^NAME/ {print ""} {printf "%s,", $2} ' | tail -n +2 > rupa.csv;
octave stage_0_Vika.m | awk -F ": " '/^NAME/ {print ""} {printf "%s,", $2} ' | tail -n +2 > Vika.csv;
python Stage_0_Busayo.py|  awk -F ": " '/^NAME/ {print ""} {printf "%s,", $2} ' | tail -n +2 > Busayo.csv;
julia stage_0_rajvi.jl |  awk -F ": " '/^NAME/ {print ""} {printf "%s,", $2} ' | tail -n +2  > rajvi.csv;
python stage_0_siddhant.py|  awk -F ": " '/^NAME/ {print ""} {printf "%s,", $2} ' | tail -n +2 > siddhant.csv;
octave stage_0_theSamurai1997.m | awk -F ": " '/^NAME/ {print ""} {printf "%s,", $2} ' | tail -n +2 > theSamurai1997.csv;
python Stage_0_Richard.py|  awk -F ": " '/^NAME/ {print ""} {printf "%s,", $2} ' | tail -n +2 > Richard.csv;
#Adds newlines at the end of csv files
echo "Running postprocessing of made csv files..."
for i in *.csv; do echo "" >> $i; done 
#Merge csvs
echo "Merging csv files..."
cat *.csv > Member_info_team-rosalind.txt;
#Remove temporary files
echo "Removing temporary files..."
rm -f *.csv 
rm -f Suritra
rm -f stage_0_Anu 
rm -f stage_0_harinath
#Rename txt file to csv one
echo "Renaming final file..."
mv Member_info_team-rosalind.txt Member_info_team-rosalind.csv
echo "Done!"
echo ""
echo -e "\033[1mPlease consider using Member_info_team-rosalind.csv file in repo directory"
echo ""
