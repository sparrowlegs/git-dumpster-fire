#!/bin/bash

# Yup, this is the "correct" way to get the current branch name.
# Returns nothing if the current directory is not a local git repo.

git symbolic-ref --short HEAD 2>/dev/null