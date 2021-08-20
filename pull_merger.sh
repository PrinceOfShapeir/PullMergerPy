#!/bin/bash

git fetch origin
URL=$(python pull_merger.py $(git branch -a))
ORIGIN="origin/"
echo $URL

git checkout -b $URL $ORIGIN$URL
git merge main
git checkout main
git merge --no-ff $URL
git push origin main
echo "We should have uploaded ${URL} to github."
echo "We probably should have tested it first."