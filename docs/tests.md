# Running the tests

## Check if dependencies are satisfied

Script for tests (`tests.sh`) is included in the repo. You can run it with the following command:
```bash
wget https://github.com/Team-Rosalind/team-rosalind-project/blob/master/tests.sh && sh tests.sh
```
The above command will download only the target script and check if all required software is already installed.

## Installing missing dependencies

### Ubuntu {docsify-ignore}
```bash
sudo apt-get update && sudo apt-get install python octave julia gcc g++ r nodejs npm
```
**Please note, that Ubuntu-based installation hasn't been checked yet. Command based on Google search results. If you have any problems please report an issue and try official instruction dor every package as stated on official sites**

### Arch-based distributions {docsify-ignore}
```bash
sudo pacman -Su && sudo pacman -S python octave julia gcc nodejs npm
```