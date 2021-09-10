#!/bin/bash

git fetch origin

URL=$(python pull_merger.py $(git branch -a))

echo $URL
if [ $URL -eq "Empty" ]
then
    exit
fi

 

ORIGIN="origin/"
echo $URL

git checkout -b $URL $ORIGIN$URL
git merge main

#This is where testing prompt goes
echo "You have merged into the main branch locally. Please open a separate command prompt and test before proceeding."
echo "Have you tested the changes? Proceed to upload to main branch? Please type 1 for yes and 0 for no."
read userInput
#If tests fail, run git reset --merge

if [ $userInput -ne 1 ]
then
    git reset --merge
    echo "Merge reset"
else
    git checkout main
    git merge --no-ff $URL
    git push origin main
    echo "We should have uploaded ${URL} to github."
    echo "We probably should have tested it first."
fi

#echo "You are finished. Would you like to merge another branch? Please type 1 or 0"
#read userInput
#if [ $userInput -ne 1 ]
#    echo "Goodbye!"
#else
#    echo "Checking for new branches."
#    echo "Checking for new branches.."
#    echo "Checking for new branches..."
#    bash pull_merger.sh
#fi