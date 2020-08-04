#!/bin/bash

echo "Running tests.."

if ! command -v python &> /dev/null
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

if ! command -v Rscript &> /dev/null
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
if ! command -v octave &> /dev/null
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
if ! command -v node &> /dev/null
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
if ! command -v gcc &> /dev/null
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
if ! command -v g++ &> /dev/null
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
if ! command -v julia &> /dev/null
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
if ! command -v awk &> /dev/null
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
echo "Done!"
echo "All requirements satisfied!"
cat << "EOF"

 _____                      ____                 _ _           _ 
|_   _|__  __ _ _ __ ___   |  _ \ ___  ___  __ _| (_)_ __   __| |
  | |/ _ \/ _` | '_ ` _ \  | |_) / _ \/ __|/ _` | | | '_ \ / _` |
  | |  __/ (_| | | | | | | |  _ < (_) \__ \ (_| | | | | | | (_| |
  |_|\___|\__,_|_| |_| |_| |_| \_\___/|___/\__,_|_|_|_| |_|\__,_|

EOF