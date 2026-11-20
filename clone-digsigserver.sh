#!/bin/bash
set -e
source ./container-name.sh

# 1. Fetch the remote branch so the specific commit hash exists locally
git fetch "${GIT_REPO}" "${GIT_REPO_BRANCH}"

# 2. Add the subtree using the exact commit ID instead of the branch name
git subtree add --prefix=src "${GIT_REPO_COMMIT_ID}" --squash
