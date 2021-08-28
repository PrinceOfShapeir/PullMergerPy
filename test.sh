#!/bin/bash

git fetch origin
URL=($(git branch -a))
remote_string="remotes/origin/dependabot"
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
    echo "Please type the number of the branch you wish to merge."
    read branchNumber
    echo "You have selected ${URLS[branchNumber]}"
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