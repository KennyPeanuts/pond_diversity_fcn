# Git and Github Instructions and Cheat–sheet

## Fortino Lab; Fall 2013

### Introduction to Git and Github

Git and Github are a version control and collaboration system that
is widely used in science. They are used to keep track of the
changes to computer files as a project develops. Git operates on an
individual computer and tracks the changes made to files locally.
Github links the git repositories on several individual local
computers together into a single cloud–based repository. File
changes are pulled from Github to a local git and pushed from a
local git to Github.

### Detailed Workflow

1.  Before you begin working you need to update your local files
    from Github with a pull.
    1.  Open the git console and change to the directory where the
        lab files are kept on your computer
    2.  Type: `git pull origin master`
    3.  You will likely have to enter your Github username and password
    4.  When this is complete your local files are synced with the
        Github files

2.  Now you need to tell git what files you want it to track
    1.  To track all the files in the directory, type: `git add *`
        (the `*` is a wildcard for "match everything")
    2.  If you don't want to track all files they list the files you
        want after `add`: `git add <em>file or directory names</em>`

3.  You can now do your work and git will keep track of any changes
    you make to the files in the directory
4.  To update your local git you need to "commit" the changes
    1.  In the git console type:
        `git commit -am "commit message"`
    2.  The `a` flag tells git to commit any file that has been changed
    3.  The `m` flag tells git that you are following with a commit
        message
    4.  -   A good commit message is a brief but specific description
            of what changes you made
        -   GOOD: "Added littoral sampling data to the LOI dataframe"
        -   BAD: "Updated data files"

    5.  Now your local git repository is up to date with the changes
        you made
    6.  You can commit as often as you want and it is usually a good
        idea to commit following each task (e.g., commit after entering the
        data and again after doing data analysis, and again after making a
        figure, etc...)

5.  When you are done with your work, you can now update the Github
    repository with a push.
    1.  Type `git push origin master`
    2.  You will need to enter your username and password
    3.  When this is complete, Github is now updated with the changes
        you made


### Workflow Cheatsheet

1.  `git pull origin master` updates local git from Github
2.  `git add *` tells git to track all files in current directory
3.  `git commit -am "<em>commit message</em>"` commits changes to
    local git and adds commit message
4.  `git push origin master` updates Github from local git



