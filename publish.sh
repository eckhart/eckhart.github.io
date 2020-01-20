#!/bin/bash -eux

echo -e "\033[0;32mDeploying updates to GitHub...\033[0m"

# Build the project.
mkdir content
hugo
rmdir content

# Add changes to git.
git add -A public/

# Commit changes.
msg="publish.sh: update github pages"
git commit -m "$msg"

# Push to master
git push origin master

# Do a subtree push to the public_html branch
git subtree push --prefix=public git@github.com:eckhart/www_docs.git gh-pages
