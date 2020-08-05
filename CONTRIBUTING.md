# Contributing

We love pull requests from everyone. By participating in this project, you
agree to abide by the thoughtbot [code of conduct].

[code of conduct]: https://thoughtbot.com/open-source-code-of-conduct


#GUIDE TO CREATING PERSONAL BRANCHES IN THE MAIN REPOSITORY.


Delete your forked repo

# Clone the original repo (team-rosalind-project)
>> git clone *https/SSH key of repo*

# Create and checkout to a new branch
>> git checkout -b hildred/stage_0

# Now you can continue with your task
# When done, run 
>> git add . && git commit -m "enter description of action carried out here" && git push --set-upstream origin hildred/stage_0

#Note: replace "hildred/stage_0" in the commands above with yours respectively.


# After team lead merges all branches, we all then need to run
>> git checkout master && git pull

# What the above command does is to take us into master branch and get the latest code (edits, submissions, deletions etc.) from it.

# Now, we will repeat the process by checking out to a new branch,
# still with our unique branch names, when another task should be carried out.
# Run,
>> git checkout -b hildred/stage_1

# We can now continue with our task and simply repeat step 5.
# NOTE: The team lead should please always delete any branch that has already been merged to prevent getting ourselves confused and littering the main repo.




    git clone git@github.com:your-username/factory_bot_rails.git

Set up your machine:

    ./bin/setup

Make your change. Add tests for your change. Make the tests pass:

    rake

Push to your fork and [submit a pull request][pr].

[pr]: https://github.com/Team-Rosalind/team-rosalind-project/pulls

At this point you're waiting on us. We like to at least comment on pull requests
within three business days (and, typically, one business day). We may suggest
some changes or improvements or alternatives.

Some things that will increase the chance that your pull request is accepted:

* Write tests.
* Follow our style guide.
* Write a good commit message.
