clc; clear; echo off; 

% Defining and setting up the variabiles
name = "Karan Kumar";
email = "karaniitg.pmrf18@gmail.com";
language = "MATLAB";
biostack = "Genomics";
username = "@theSamurai1997";

% Setting up and formatting the printing messages
my_name = sprintf("NAME : %s", name);
my_email = sprintf("E-MAIL ID : %s", email);
my_language = sprintf("Programming Language : %s", language);
my_biostack = sprintf("BIOSTACK : %s", biostack);
my_username = sprintf("Slack UserID : %s", username);

% Printing the informations
disp(my_name);
disp(my_email);
disp(my_language);
disp(my_biostack);
disp(my_username);
