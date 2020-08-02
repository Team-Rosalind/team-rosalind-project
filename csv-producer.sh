#!/bin/bash
# This is Team-Rosalind's script for producing csv file 
# Written as part of HackBio 2020 internship 

#clone github repo to the current directory and goes to the project directory
git clone https://github.com/Team-Rosalind/team-rosalind-project.git && cd team-rosalind-project;

#run your scripts. Output is 1 line csv file
julia stage_o_pavlo.jl |  awk -F ": " '/^NAME/ {print ""} {printf "%s,", $2} ' | tail -n +2 > pavlo.csv;


#Merge csvs
cat *.csv > Member_info_team-rosalind.txt;
rm -f *.csv && mv Member_info_team-rosalind.txt Member_info_team-rosalind.csv