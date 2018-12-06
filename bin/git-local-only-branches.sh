#!/bin/bash

# Return a list of branches which do not have a remote (upstream) branch.
# Return nothing if current directory is not a local git repo.

git_info=`git show --oneline HEAD 2>/dev/null`

if [ -z "${git_info}" ]; then
    exit 1
fi

comm -23 <(git branch | sed 's/\* /  /' | sort) <(git branch -r | sed 's|origin/||' | sort) | perl -pe 's/^ +//'
