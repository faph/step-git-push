#!/bin/bash
source build-esen.sh

if [ -z "$WERCKER_GIT_PUSH_REPO" ]; then
  fail "Please provide a repository URI."
fi

if [ -z "$WERCKER_GIT_PUSH_BRANCH" ]; then
  export WERCKER_GIT_PUSH_BRANCH=master
fi

if [ -z "$WERCKER_GIT_PUSH_BASEDIR" ]; then
  export WERCKER_GIT_PUSH_BASEDIR="."
fi
basePath=$(pwd)/$WERCKER_GIT_PUSH_BASEDIR/

if [ -z "$WERCKER_GIT_PUSH_CLEAN_REMOVED_FILES" ]; then
  export WERCKER_GIT_PUSH_CLEAN_REMOVED_FILES="false"
else
  # force lowercase
  WERCKER_GIT_PUSH_CLEAN_REMOVED_FILES="${WERCKER_GIT_PUSH_CLEAN_REMOVED_FILES,,}"
fi

repoDir="/tmp/git/repo"
# Remove previously cloned repo, if exist
rm -rf $repoDir

cloneRepo "$WERCKER_GIT_PUSH_REPO" "$WERCKER_GIT_PUSH_BRANCH" "$repoDir"
copyFiles "$basePath" "$repoDir"

if commitFiles "$repoDir"; then
  pushFiles "$repoDir" "$WERCKER_GIT_PUSH_REPO" "$WERCKER_GIT_PUSH_BRANCH"
else
  info "Skip pushing files."
fi
