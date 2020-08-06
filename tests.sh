#!/bin/bash

echo "Running tests.."

if ! command -v python > /dev/null
then
    echo "Python could not be found"
    echo "Please run for Ubuntu-based systems:"
    echo ""
    echo "sudo apt-get install python" 
    echo ""
    echo "or for Arch-based systems:"
    echo ""
    echo "sudo pacman -S python"
    echo ""
    exit
fi;

if ! command -v Rscript > /dev/null
then
    echo "Rscipt could not be found"
    echo "Please run for Ubuntu-based systems:"
    echo ""
    echo "sudo apt-get install r" 
    echo ""
    echo "or for Arch-based systems:"
    echo ""
    echo "sudo pacman -S r"
    echo ""
    exit
fi;
if ! command -v octave > /dev/null
then
    echo "Octave could not be found"
    echo "Please run for Ubuntu-based systems:"
    echo ""
    echo "sudo apt-get install octave" 
    echo ""
    echo "or for Arch-based systems:"
    echo ""
    echo "sudo pacman -S octave"
    echo ""
    exit
fi;
if ! command -v node > /dev/null
then
    echo "Nodejs could not be found"
    echo "Please run for Ubuntu-based systems:"
    echo ""
    echo "sudo apt-get install nodejs npm" 
    echo ""
    echo "or for Arch-based systems:"
    echo ""
    echo "sudo pacman -S nodejs npm"
    echo ""
    exit
fi;
if ! command -v gcc > /dev/null
then
    echo "gcc could not be found"
    echo "Please run for Ubuntu-based systems:"
    echo ""
    echo "sudo apt-get install gcc"
    echo "" 
    echo "or for Arch-based systems:"
    echo ""
    echo "sudo pacman -S gcc"
    echo ""
    exit
fi;
if ! command -v g++ > /dev/null
then
    echo "g++ could not be found"
    echo "Please run for Ubuntu-based systems:"
    echo ""
    echo "sudo apt-get install g++" 
    echo ""
    echo "or for Arch-based systems:"
    echo ""
    echo "sudo pacman -S gcc"
    echo ""
    exit
fi;
if ! command -v julia > /dev/null
then
    echo "Julia could not be found"
    echo "Please run for Ubuntu-based systems:"
    echo ""
    echo "sudo apt-get install julia" 
    echo ""
    echo "or for Arch-based systems:"
    echo ""
    echo "sudo pacman -S julia"
    echo ""
    exit
fi;
if ! command -v awk > /dev/null
then
    echo "awk could not be found"
    echo "Please run for Ubuntu-based systems:"
    echo ""
    echo "sudo apt-get install awk" 
    echo ""
    echo "or for Arch-based systems:"
    echo ""
    echo "sudo pacman -S awk"
    echo ""
    exit
fi;
if ! command -v sed > /dev/null
then
    echo "sed could not be found"
    echo "Please run for Ubuntu-based systems:"
    echo ""
    echo "sudo apt-get install sed" 
    echo ""
    echo "or for Arch-based systems:"
    echo ""
    echo "sudo pacman -S sed"
    echo ""
    exit
fi;
if ! command -v parallel > /dev/null
then
    echo "parallel could not be found"
    echo "Please run for Ubuntu-based systems:"
    echo ""
    echo "sudo apt-get install parallel" 
    echo ""
    echo "or for Arch-based systems:"
    echo ""
    echo "sudo pacman -S parallel"
    echo ""
    exit
fi;
echo "Done!"
echo "All requirements satisfied!"
echo "Running test scripts..."
cd tests;
ls *.py | parallel  "python {} |awk -F ': ' ' {print \$2} ' |paste -sd ',' > {.}.csv";
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
cd ..;

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
