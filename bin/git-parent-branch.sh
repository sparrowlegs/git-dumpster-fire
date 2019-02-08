#!/bin/bash

# Returns name of the branch from which the current branch was created.
# If the current branch is "develop" then "master" is returned.
# If the current branch is "master" then nothing is returned.
# Return nothing if current directory is not a local git repo.

current_branch=`git symbolic-ref --short HEAD 2>/dev/null`

if [ -z "${current_branch}" ]; then
    exit 1
fi

if [ "${current_branch}" == "develop" ]; then
    echo "master"
    exit 0
fi
    
if [ "${current_branch}" == "master" ]; then
    exit 0
fi

git show-branch -a 2>/dev/null | grep '\*' | grep -v "${current_branch}" | fgrep -v "[origin" | head -n1 | perl -ple 's/[^\[]+\[[A-Za-z]+-\d+\][^\]]+$//; s/^[^\[]+\[([^~^\]]+).*$/$1/'

