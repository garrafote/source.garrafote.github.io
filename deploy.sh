#!/bin/sh

# clean and rebuild public folder
rm -rf public
hugo -D

# commit changes
git add public
git show -s --format='deploy: %s' | { read message; git commit --amend -m"$message"; }

# deploy to github.io repository
git subtree push --prefix=public io master