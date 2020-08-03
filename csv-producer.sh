#!/bin/bash
# This is Team-Rosalind's script for producing csv file 
# Written as part of HackBio 2020 internship 

#clone github repo to the current directory and goes to the project directory
git clone https://github.com/Team-Rosalind/team-rosalind-project.git && cd team-rosalind-project;

#run your scripts. Output is 1 line csv file
gcc -o Anu stage_0_Anu.C;
g++ -o Suritra stage_0_Suritra.cpp;
julia stage_0_pavlo.jl |  awk -F ": " '/^NAME/ {print ""} {printf "%s,", $2} ' | tail -n +2 > pavlo.csv;
./Anu |  awk -F ": " '/^NAME/ {print ""} {printf "%s,", $2} ' | tail -n +2 > Anu.csv;
node stage_0_dolu.js  |  awk -F ": " '/^NAME/ {print ""} {printf "%s,", $2} ' | tail -n +2 > dolu.csv;
python stage_0_hildred.py |  awk -F ": " '/^NAME/ {print ""} {printf "%s,", $2} ' | tail -n +2 > hildred.csv;
Rscript stage_0_shirine.R |  awk -F ": " '/^NAME/ {print ""} {printf "%s,", $2} ' | tail -n +2 > shirine.csv;
./Suritra |  awk -F ": " '/^NAME/ {print ""} {printf "%s,", $2} ' | tail -n +2 > Suritra.csv;
python Stage_0_Leye.py|  awk -F ": " '/^NAME/ {print ""} {printf "%s,", $2} ' | tail -n +2 > Leye.csv;
Rscript Stage_0_Ife.R |  awk -F ": " '/^NAME/ {print ""} {printf "%s,", $2} ' | tail -n +2 > Ife.csv;

#Merge csvs
cat *.csv > Member_info_team-rosalind.txt;
rm -f *.csv && mv Member_info_team-rosalind.txt Member_info_team-rosalind.csv