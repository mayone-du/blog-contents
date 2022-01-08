#!/bin/bash
git add -N .
if [ ! git diff --exit-code --quiet ]; then
  git config user.name github-actions
  git config user.email github-actions@github.com
  git add .
  git commit -m "update: meta by bot"
  git push
fi