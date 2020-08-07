#!/bin/bash
# This code was created as a part of the demonstarion video.
# It' behaviour consist of printing out the command, execute that command and wait for user input to continue.
# Then terminal is cleaned and other command is printed and executed
# Origianlly this was used for pipeline decomposition

echo
echo "julia stage_0_pavlo.jl"
echo
julia stage_0_pavlo.jl ;
read -p "Continue (y/n)?" choice
case "$choice" in 
  y|Y ) echo "";;
  n|N ) echo "";;
  * ) echo "invalid";;
esac
clear
echo
echo "julia stage_0_pavlo.jl | awk -F ': ' ' {print $2} ' "
echo
julia stage_0_pavlo.jl | awk -F ': ' ' {print $2} ' 
read -p "Continue (y/n)?" choice
case "$choice" in 
  y|Y ) echo "";;
  n|N ) echo "";;
  * ) echo "invalid";;
esac
clear
echo
echo "julia stage_0_pavlo.jl | awk -F ': ' ' {print $2} ' | paste -sd ','"
echo
julia stage_0_pavlo.jl | awk -F ': ' ' {print $2} ' | paste -sd ','
read -p "Continue (y/n)?" choice
case "$choice" in 
  y|Y ) echo "";;
  n|N ) echo "";;
  * ) echo "invalid";;
esac
clear
echo
echo "cat spaces_test.txt"
echo
cat spaces_test.txt
read -p "Continue (y/n)?" choice
case "$choice" in 
  y|Y ) echo "";;
  n|N ) echo "";;
  * ) echo "invalid";;
esac
clear
echo
echo "cat spaces_test.txt | sed 's/,\s*,/,/g'  "
echo
cat spaces_test.txt | sed 's/,\s*,/,/g' 
read -p "Continue (y/n)?" choice
case "$choice" in 
  y|Y ) echo "";;
  n|N ) echo "";;
  * ) echo "invalid";;
esac
clear
echo
echo "cat spaces_test.txt | sed 's/,\s*,/,/g' |sed 's/^,//g' "
echo
cat spaces_test.txt | sed 's/,\s*,/,/g' |sed 's/^,//g' 
read -p "Continue (y/n)?" choice
case "$choice" in 
  y|Y ) echo "";;
  n|N ) echo "";;
  * ) echo "invalid";;
esac
clear
echo
echo "cat spaces_test.txt | sed 's/,\s*,/,/g' |sed 's/^,//g' | sed 's/,\s*/,/g' "
echo
cat spaces_test.txt | sed 's/,\s*,/,/g' |sed 's/^,//g' | sed 's/,\s*/,/g' 
read -p "Continue (y/n)?" choice
case "$choice" in 
  y|Y ) echo "";;
  n|N ) echo "";;
  * ) echo "invalid";;
esac
clear
echo
echo "cat spaces_test.txt | sed 's/,\s*,/,/g' |sed 's/^,//g' | sed 's/,\s*/,/g' | sed 's/^\s*//g' "
echo
cat spaces_test.txt | sed 's/,\s*,/,/g' |sed 's/^,//g' | sed 's/,\s*/,/g' | sed 's/^\s*//g' 
