#!/bin/bash

git fetch origin
git remote prune origin
URL=($(git branch -a))
remote_string="remotes/origin/dependabot"
ORIGIN="origin/"
URLS=()
declare -i count
count=0
for i in "${URL[@]}"
do  
    if [[ "$i" == *"$remote_string"* ]]
    then
        count+=1
        substr="${i:15}"
        URLS+=("${substr}")
        echo "${count}. ${substr}"
        #echo $i
    fi
done
#echo $URLS

if [[ "$count" -gt 0 ]]
then
    #echo "contents of urls array: $URLS"
    echo "Please type the number of the branch you wish to merge."
    read branchNumber
    URL=${URLS[branchNumber-1]}
    echo "You have selected $URL"
    git checkout -b $URL $ORIGIN$URL
    echo "Is your default branch labeleld 'main' or 'master?' If it is 'main' simply hit enter. Otherwise type 1, to enable backwards compatibility with legacy syntax."
    DEFAULT="main"
    read defaultAlias
        if [ $defaultAlias -eq 1 ]
        then
            DEFAULT="master"
            echo "Default master selected."
        else
            echo "Default main selected."
        fi
    git merge $DEFAULT
    
    #This is where testing prompt goes
    echo "You have merged into the $DEFAULT branch locally. Please open a separate command prompt and test before proceeding."
    echo "Have you tested the changes? Proceed to upload to $DEFAULT branch? Please type 1 for yes and 0 for no."
    read userInput
    #If tests fail, run git reset --merge

    if [ $userInput -ne 1 ]
    then
        git reset --merge
        echo "Merge reset"
        git branch -d $URL
    else
        git checkout $DEFAULT
        git merge --no-ff $URL
        git push origin $DEFAULT
        echo "We should have uploaded ${URL} to github."
        echo "We probably should have tested it first."
        git checkout $DEFAULT
        git branch -D $URL
    fi
else 
    echo "No branches to merge!"
fi

#regex=""
#declare -a URLS
#for i in "${URL[@]}"
#do
#    if [[ "$remote_string" =~  "${i}\+.*" ]]
#    then
#        echo "something"
#        URLS+=$i
#    fi
#done
#echo $URLS

# git branch -d dependabot/npm_and_yarn/y18n-4.0.3

