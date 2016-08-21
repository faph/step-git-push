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

cloneInto="/tmp/clonedrepo"
# Remove previously cloned repo, if exist
rm -rf $cloneInto

cloneRepo "$WERCKER_GIT_PUSH_REPO" "$WERCKER_GIT_PUSH_BRANCH" "$cloneInto"
copyFiles "$basePath" "$cloneInto"
commitFiles "$cloneInto"
