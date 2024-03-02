#!/bin/bash
set -euo pipefail
IFS=$'\n\t'

# Copy the CNAME and the README
cp CNAME _site/
cp README.md _site/

# go to the out directory and create a *new* Git repo
cd _site

git init --initial-branch=gh-pages

# https://api.github.com/users/github-actions[bot]
git config --global user.email "41898282+github-actions[bot]@users.noreply.github.com"
git config --global user.name "GitHub Actions [Bot]"

# The first and only commit to this new Git repo contains all the
# files present with the commit message "Deploy to GitHub Pages".
git add .
git commit -m "Deploy to GitHub Pages"

# Publish to GitHub Pages
git push --force --quiet --set-upstream "https://${GITHUB_ACTOR}:${GITHUB_TOKEN}@${GH_REF}" gh-pages
