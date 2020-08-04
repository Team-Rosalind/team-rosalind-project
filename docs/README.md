<h1 align="center">Hi 👋, We are Team-Rosalind 💝</h1>
<h3 align="center">The team of 30 people for HackBio'2020 Virtual Bioinformatics Internship 🖨️</h3>

<p align="center"> <img src="https://komarev.com/ghpvc/?username=team-rosalind" alt="team-rosalind"/> </p>



- 🔭 We are currently working on [team-rosalind-project](team-rosalind-project)

- 👨‍💻 HackBio Channel [https://hackbio-internship.github.io/webpage-test/](https://hackbio-internship.github.io/webpage-test/)

- 💬 Ask us about **Anything Science! We are your friendly neighborhood science people 🔬**

- 📫 How to reach us? **siddhaantsharma.ss@gmail.com**

- ⚡ Fun fact **We are a diverse community from many nations🤗**




<p align="center">
<a href="https://twitter.com/tbi_internship" target="blank"><img align="center" src="https://cdn.jsdelivr.net/npm/simple-icons@3.0.1/icons/twitter.svg" alt="tbi_internship" height="20" width="20" /></a>
<a href="https://instagram.com/ssiddhaantsharma" target="blank"><img align="center" src="https://cdn.jsdelivr.net/npm/simple-icons@3.0.1/icons/instagram.svg" alt="ssiddhaantsharma" height="20" width="20" /></a>
<a href="https://www.youtube.com/c/ucrp4skeqrnbax0od3ybyt1w" target="blank"><img align="center" src="https://cdn.jsdelivr.net/npm/simple-icons@3.0.1/icons/youtube.svg" alt="ucrp4skeqrnbax0od3ybyt1w" height="20" width="20" /></a>
</p>

<p align="center">
 
</p>

# Project

![GitHub last commit](https://img.shields.io/github/last-commit/Team-Rosalind/team-rosalind-project)
![GitHub issues](https://img.shields.io/github/issues-raw/Team-Rosalind/team-rosalind-project)
![Contributions welcome](https://img.shields.io/badge/contributions-welcome-orange.svg)
 [![Maintenance](https://img.shields.io/badge/Maintained%3F-yes-green.svg)](https://github.com/Team-Rosalind/team-rosalind-project/graphs/commit-activity) [![Team Rosalind](https://img.shields.io/website-up-down-green-red/http/shields.io.svg)](https://team-rosalind.github.io/team-rosalind-project/)
[![PRs Welcome](https://img.shields.io/badge/PRs-welcome-brightgreen.svg?style=flat-square)](http://makeapullrequest.com)
[![License](https://img.shields.io/badge/license-MIT-blue.svg)](https://opensource.org/licenses/MIT)

 
![HackBio](https://github.com/Team-Rosalind/team-rosalind-project/blob/master/CPP_Task/HackBio.jfif) <br>
Image Source: [@tbi_internship](https://twitter.com/tbi_internship)

> This is the main repository for the HackBio'2020 Virtual Internship Experience. <br>
Main goal of the project is write small scripts in different languages with the next output in sdout - `name, e-mail, used_language, biostack, slack_username`. Next step is to make csv file with rows corresponding to the person and columns to the values (as name, e-mail, etc) in bash, using sdout from scripts. <br>

> For neat-looking documentation check out [![Team-Rosalind](https://img.shields.io/badge/webiste-live-brightgreen.svg?style=flat-square)](https://team-rosalind.github.io/team-rosalind-project/)<br><br> 
![Banner](https://github.com/navendu-pottekkat/awesome-readme/blob/master/header.png)<br>
[![forthebadge](https://forthebadge.com/images/badges/built-with-science.svg)](https://forthebadge.com)
[![forthebadge](https://forthebadge.com/images/badges/powered-by-electricity.svg)](https://forthebadge.com)
[![forthebadge](https://forthebadge.com/images/badges/makes-people-smile.svg)](https://forthebadge.com)


# 🚩 Table of content
- [Getting Started](#getting-started)
  * [Prerequisites](#prerequisites)
  * [Running the tests](#running-the-tests)
    + [Check if dependencies are satisfied](#check-if-dependencies-are-satisfied)
    + [Installing missing dependencies](#installing-missing-dependencies)
  * [Installing](#installing)
- [Flowchart](#flowchart)
- [Usage](#usage)
- [Versioning](#versioning)
- [For participants](#for-participants)
  * [Goals (Stage 0):](#goals--stage-0--)
  * [Language check](#language-check)
  * [I am not a coder, what should I choose?](#i-am-not-a-coder--what-should-i-choose-)
  * [Unified template for output](#unified-template-for-output)
  * [Generate a new table of content](#generate-a-new-table-of-content)

# 🤖 Getting Started
## Prerequisites 
- [Julia language](https://julialang.org/)
- [Octave](https://www.gnu.org/software/octave/)
- [Python language](https://www.python.org/)
- [GCC and G++ compilers](https://gcc.gnu.org/). Available via standard package managers
- [R language](https://www.r-project.org/)
- [Nodejs](https://nodejs.org/uk/download/package-manager/) for javascript
- Linux (awk command must be recognisable in shell)



![Random GIF](https://media.giphy.com/media/ZVik7pBtu9dNS/giphy.gif)
## 🎨 Running the tests

### Check if dependencies are satisfied

Script for tests (`tests.sh`) is included in the repo. You can run it with the following command:
```bash
wget https://github.com/Team-Rosalind/team-rosalind-project/blob/master/tests.sh && sh tests.sh
```
The above command will download only the target script and check if all required software is already installed.

### Installing missing dependencies

#### Ubuntu 
```bash
sudo apt-get update && sudo apt-get install python octave julia gcc g++ r nodejs npm
```
**Please note, that Ubuntu-based installation hasn't been checked yet. Command based on Google search results. If you have any problems please report an issue and try official instruction dor every package as stated on official sites**

#### Arch-based distributions
```bash
sudo pacman -Su && sudo pacman -S python octave julia gcc nodejs npm
```
## Installing
The main goal of the project is to create a bash script that will clone the repo and produce a csv file with the participants' personal information. For this goal no installation is required, however check if all dependencies are satisfied.

# 📜 Flowchart

![WorkFlow_HackBio](https://github.com/Team-Rosalind/team-rosalind-project/blob/master/CPP_Task/WorkFlow_HackBIo.png) <br>
Made using [diagrams.net](https://app.diagrams.net/)

# 🔧 Usage
Please download the following script `csv-producer.sh`. Downloading and running the script can be done from a terminal with the following command:
```bash
wget https://github.com/Team-Rosalind/team-rosalind-project/blob/master/csv-producer.sh && sh csv-producer.sh 
```
**Script is intended to work only in Linux-based systems**

# 🌏 Versioning
- README.md -> v 1.7
- csv-producer -> v 2.0
- stage_0_Anu.C v 1.1
- stage_0_Suritra.cpp -> v 1.0
- stage_0_Vika.m -> v 1.0
- stage_0_dolu.js -> v 1.1
- stage_0_harinath.C -> v 1.0
- stage_0_hildred.py -> v 1.6
- stage_0_pavlo.jl -> v 1.0
- stage_0_rajvi.jl -> v 1.0
- stage_0_rupa.py -> v 1.0
- stage_0_shirine.R -> v 1.0
- Stage_0_Ife.R -> v 1.0
- Stage_0_Leye.py -> v 1.1
- Stage_0_siddhant.py -> v 1.3
- Stage_0_Busayo.py -> v 1.1


# 💬 For participants
## Goals (Stage 0):
* Make this documentation neat and nice. (Novice Friendly)
* Complete task 2 (multiple languages)
* Make a simple bash script for git commit

## Language check
- [x] Python
- [x] Julia
- [x] C++
- [x] R 
- [ ] Java
- [x] MATLAB
- [x] Javascript 
- [x] C

Note: The checklist has 8 languages right now. The minimum required amount is 7. If it is not satisfied, please choose unchecked languages from a list. 

## I am not a coder, what should I choose?
Everyone began from something (: Actually the language in this task doesn't matter, as the script is very simple.
You can search smth similar to "write hello world script in *language_of_interest* ".

If all of the languages are checked, and the requirements (about programming language variety) are satisfied, you are free to choose whatever language you like. A good start is to become more familiar with R or Python. Both of these languages are extremely popular within the bioinformatics community. See templates for "Hello world script" for [R](https://www.geeksforgeeks.org/hello-world-in-r-programming/) and [Python](https://www.learnpython.org/en/Hello,_World!).

## Unified template for output
Human text is an excellent example of unstructured data. Desired fields (for this task) can be printed out in many different ways. Therefore I propose a unified template for your script output:


```bash
NAME: *Your full name*
E-MAIL: *Your e-mail* 
USED LANGUAGE: *Name of used scripted language. All letters are capital*
BIOSTACK: *Name of biostack you chose. The only first letter is capital* 
SLACK USERNAME: @+*username*
```
An example:
```bash
NAME: Pavlo Hrab
E-MAIL: pavlo.hrab@lnu.edu.ua
USED LANGUAGE: JULIA
BIOSTACK: Genomics
SLACK USERNAME: @pavlo 
```
**After you get the desired output, please name your file _stage_0_slack-username_ <br> An example:** 
`stage_0_pavlo.jl `

## Generate a new table of content
The table of content was generated [here](https://ecotrust-canada.github.io/markdown-toc/) Please if you do any updates to file itself, update a table of content as well

## 🚀 Contributing

Contributions are what make the open source community such an amazing place to be learn, inspire, and create. Any contributions you make are **greatly appreciated** 🎉
*Working on your first Pull Request? [How to Contribute to an Open Source Project on GitHub](https://egghead.io/series/how-to-contribute-to-an-open-source-project-on-github)*

1. Fork the Project
2. Create your Feature Branch (`git checkout -b feature/AmazingFeature`)
3. Commit your Changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the Branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request

![Footer](https://github.com/navendu-pottekkat/awesome-readme/blob/master/fooooooter.png)
