#!/bin/sh

set -e
set -u

### synchronize with remote repo

# git
cd "$CHEAT_REPO"
git pull && git push

# EverNote
if which gnsync; then
  gnsync --two-way true --path "$CHEAT_REPO" --mask '*.md' --format markdown \
  --logpath "$CHEAT_REPO/gnsync.log" --notebook cheatsheets
fi
