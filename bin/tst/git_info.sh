#!/bin/sh

get_config() {
  git config --list
}

most_recent_commit() {
  git log --max-count=1 --pretty=short
}

local_branches() {
  git branch
}

remote_branches() {
  git branch -r
}

remote_urls() {
  git remote -v
}

# Show info similar to svn

echo
echo "## Remote URLs:\n"
echo "$(remote_urls)\n"

echo "## Remote Branches:\n"
echo "$(remote_branches)\n"

echo "## Local Branches:\n"
echo "$(local_branches)\n"

echo "## Most Recent Commit:\n"
echo "$(most_recent_commit)\n"
echo "Type 'git log' for more commits, or 'git show <commit id>' for full commit details.\n"

if test "$1" != "--no-config"; then
  echo "## Configuration (.git/config):\n"
  echo "$(get_config)\n"
fi
