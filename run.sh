#!/bin/bash
source build-esen.sh

# Remote repository to pull from and push to
if [ -z "$WERCKER_GIT_PUSH_REPO" ]; then
  fail "Please provide a repository URI."
fi
repo="${WERCKER_GIT_PUSH_REPO#ssh://}"
info "repo: ${repo}"

# Remote repository's branch
branch=${WERCKER_GIT_PUSH_BRANCH-master}
info "branch: ${branch}"

# Directory to copy files from into repo
basePath=$(pwd)/${WERCKER_GIT_PUSH_BASEDIR-.}/
info "basePath: ${basePath}"

# Whether to ignore remove files from repo not in basePath, default: false
ignoreRemoved=${WERCKER_GIT_PUSH_IGNORE_REMOVED_FILES-false} 
info "ignoreRemoved: ${ignoreRemoved}"

# Clone repo into this directory
repoDir=$(tempDirName)
info "repoDir: ${repoDir}"

cloneOrInitRepo "$repo" "$branch" "$repoDir" \
  && copyFiles "$basePath" "$repoDir" "$ignoreRemoved" \
  && ( 
    if commitFiles "$repoDir"; then
      pushFiles "$repoDir" "$repo" "$branch"
    else
      info "Skipping push."
    fi 
  )

