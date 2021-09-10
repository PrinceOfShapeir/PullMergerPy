# PullMergerPy


The name is an artifact from when I used a python script for some handy input processing. This became less handy when it turns out python will lack the foreground execution context needed to read any input, when it is invoked from inside of a bash script. Now everything is written entirely in bash.

How to use: 

1. Copy pull_merger.sh into the main folder of your local git repository. 
2. Ensure there are no uncommited local changes (for sanity).
3. Open Git Bash, and run `bash pull_merger.sh`. That's it.
4. Follow the on screen instructions to merge remote branches. Currently only dependabot branches are supported.
5. If your shell opens up a text editor, type `:wq` to get out of there. 

If you screw things up the following commands are useful:

* `git reset --merge`, if something crashes during the operation.  
* `git checkout main` or `git checkout master` depending on your repo.  
* `git fetch`.  
* `git remote prune origin`, followed by `git branch -d (Insert Branch Name Here without parentheses)`, if stale branches are still stuck in local.  

By using this script, agree to add "pull_merger.sh" to your .gitignore file. 