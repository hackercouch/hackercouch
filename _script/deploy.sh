#!/bin/bash
set -euo pipefail
IFS=$'\n\t'

# Copy the CNAME and the README
cp CNAME _site/
cp README.md _site/

# go to the out directory and create a *new* Git repo
cd _site

git init --initial-branch=gh-pages

# The first and only commit to this new Git repo contains all the
# files present with the commit message "Deploy to GitHub Pages".
git add .
git commit -m "Deploy to GitHub Pages"

# Publish to GitHub Pages
git push --force --quiet "https://${GITHUB_TOKEN}@${GH_REF}"
