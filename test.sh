#!/bin/bash

git fetch origin
URL=$(python pull_merger.py $(git branch -a))
echo $URL
