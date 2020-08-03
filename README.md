

## Project : 
This is the main repository for the HackBio'2020 Virtual Internship Experience. <br>

Main goal of the project is write small scripts in different languages with the next output in sdout - name, e-mail, used_language, biostack, slack_username. Next step is to make csv file with rows corresponding to the person and columns to the values (as name, e-mail, etc) in bash, using sdout from scripts. The only master csv is evaluated and information in it

- [For participants](#for-participants)
  * [Goals (Stage 0):](#goals--stage-0--)
  * [Language check](#language-check)
      - [I am not a coder, what should a choose?](#i-am-not-a-coder--what-should-a-choose-)
  * [Unified template for output](#unified-template-for-output)
  * [Get the version of everything!](#get-the-version-of-everything-)
  * [Generate a new table of content](#generate-a-new-table-of-content)
- [Dependencies](#dependencies)
  * [Installation](#installation)
    + [Ubuntu](#ubuntu)
    + [Arch-based distributions](#arch-based-distributions)
- [Flowchart](#flowchart)
- [Run the project](#run-the-project)

## For participants
### Goals (Stage 0):
* Make this documentation neat and nice. (Novice Friendly)
* Complete task 2 (multiple languages)
* Make a simple bash script for git commit

### Language check
- [x] Python
- [x] Julia
- [x] C++
- [x] R 
- [ ] Java
- [x] MATLAB
- [x] Javascript 
- [x] C

Note: The checklist has 8 languages right now. The minimum required amount is 7. If it is not satisfied, please choose unchecked languages from a list. 

##### I am not a coder, what should a choose?
Everyone began from something (: Actually the language in this task doesn't matter, as the script is very simple.
You can search smth similar to "write hello world script in *language_of_interest* ".

If all of the languages are checked, and the requirements (about programming language variety) are satisfied, you are free to choose whatever language you like. A good start is to become more familiar with R or Python. Both of these languages are extremely popular within the bioinformatics community. See templates for "Hello world script" for [R](https://www.geeksforgeeks.org/hello-world-in-r-programming/) and [Python](https://www.learnpython.org/en/Hello,_World!).

### Unified template for output
Human text is an excellent example of unstructured data. Desired fields (for this task) can be printed out in many different ways. Therefore I propose a unified template for your script output:

>NAME: *Your full name* <br>
>E-MAIL: *Your e-mail* <br>
>USED LANGUAGE: *Name of used scripted language. All letters are capital* <br>
>BIOSTACK: *Name of biostack you chose. The only first letter is capital* <br>
>SLACK USERNAME: @+*username* <br>

An example:

>NAME: Pavlo Hrab <br>
>E-MAIL: pavlo.hrab@lnu.edu.ua <br>
>USED LANGUAGE: JULIA <br>
>BIOSTACK: Genomics <br>
>SLACK USERNAME: @pavlo <br>

**After you get the desired output, please name your file _stage_0_slack-username_ <br> An example:** 
>stage_0_pavlo.jl <br>

### Get the version of everything!
- README.md -> v 1.2
- csv-producer -> v 1.5
- stage_0_Anu.C v 1.1
- stage_0_Suritra.cpp -> v 1.0
- stage_0_Vika.m -> v 1.0
- stage_0_dolu.js -> v 1.1
- stage_0_harinath.C -> v 1.0
- stage_0_hildred.py -> v 1.1
- stage_0_pavlo.jl -> v 1.0
- stage_0_rajvi.jl -> v 1.0
- stage_0_rupa.py -> v 1.0
- stage_0_shirine.R -> v 1.0
- Stage_0_Ife.R -> v 1.0
- Stage_0_Leye.py -> v 1.1
- Stage_0_siddhant.py -> v 1.3
- Stage_0_Busayo.py -> v 1.1
### Generate a new table of content
The table of content was generated [here](https://ecotrust-canada.github.io/markdown-toc/) Please if you do any updates to file itself, update a table of content as well

## Dependencies 
- [Julia language](https://julialang.org/)
- [Octave](https://www.gnu.org/software/octave/)
- [Python language](https://www.python.org/)
- [GCC and G++ compilers](https://gcc.gnu.org/). Availavle via standard package managers
- [R language](https://www.r-project.org/)
- [Nodejs](https://nodejs.org/uk/download/package-manager/) for javascript
- Linux
### Installation
Most of the dependencies are easy to install via standard package managers (apt, pacman, yay, etc. ). However official instructions are available on the sites, linked above. 
Example installations:
#### Ubuntu
>sudo apt-get update; <br>
>sudo apt-get install python octave julia gcc g++ r nodejs npm; <br>

**Please note, that Ubuntu-based installation hasn't been checked yet. Command based on Google search results. If you have any problems please report an issue and try official instruction dor every package as stated on official sites**

#### Arch-based distributions
>sudo pacman -Su; <br>
>sudo pacman -S python octave julia gcc nodejs npm; <br>

## Flowchart

**TO-DO**

## Run the project
Please download the following script _csv-producer.sh_. Downloading and running the script can be done from a terminal with the following command: <br>
>wget https://github.com/Team-Rosalind/team-rosalind-project/blob/master/csv-producer.sh && sh csv-producer.sh 

**Script is intended to work only in Linux-based systems**
