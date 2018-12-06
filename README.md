# git-dumpster-fire
A collection of scripts and configuration to make Git more usable.

The `config/.gitconfig` assumes that the `bin` directory in your path. 

### Scripts

**git-current-branch.sh** : Returns the current branch name.

**git-parent-branch.sh** : Returns name of the branch from which the current branch was created.

**git-local-only-branches.sh** : Return a list of branches which do not have a remote (upstream) branch.

**git-refresh-parent-branch.sh** : Refreshes the parent branch without switching away from the current branch.
