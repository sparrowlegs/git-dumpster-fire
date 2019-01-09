#!/bin/bash

# Refreshes the parent branch without switching away from the current branch.
#
# If the current branch is "develop" or "master" then "git pull" is invoked.
# Does nothing nothing if current directory is not a local git repo.

current_branch=`git symbolic-ref --short HEAD 2>/dev/null`

if [ -z "${current_branch}" ]; then
    exit 1
fi

if [ "${current_branch}" == "develop" -o "${current_branch}" == "master" ]; then
    echo "pulling from ${current_branch}"
    git pull
    exit 0
fi

parent_branch=`git show-branch -a 2>/dev/null | grep '\*' | grep -v "${current_branch}" | head -n1 | perl -ple 's/[^\[]+\[[A-Za-z]+-\d+\][^\]]+$//; s/^[^\[]+\[([^~^\]]+).*$/$1/'`

if [ -z "${parent_branch}" ]; then
    echo "Couldn't find parent branch"
    exit 1
fi

read -r -p "Refresh parent branch ${parent_branch}? [Y/n]" response
if [[ $response =~ ^(Y|y| ) ]] || [[ -z $response ]]; then
 	echo "refreshing ${parent_branch}"
	git fetch origin "${parent_branch}:${parent_branch}"
fi
