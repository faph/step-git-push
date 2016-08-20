#!/bin/bash
source build-esen.sh

if [ -z "$WERCKER_GIT_PUSH_REPO" ]; then
  fail "Please provide a repository URI."
fi

if [ -z "$WERCKER_GIT_PUSH_BRANCH" ]; then
  export WERCKER_GIT_PUSH_BRANCH=master
fi

if [ -z "$WERCKER_GIT_PUSH_BASEDIR" ]; then
  export WERCKER_GIT_PUSH_BASEDIR="./"
fi

if [ -z "$WERCKER_GIT_PUSH_CLEAN_REMOVED_FILES" ]; then
  export WERCKER_GIT_PUSH_CLEAN_REMOVED_FILES="false"
else
  # force lowercase
  WERCKER_GIT_PUSH_CLEAN_REMOVED_FILES="${WERCKER_GIT_PUSH_CLEAN_REMOVED_FILES,,}"
fi

debug "Parameters configured OK."

cloneInto="/tmp/clonedrepo"
# Remove previously cloned repo, if exist
rm -rf $cloneInto

debug $WERCKER_GIT_PUSH_REPO
cloneRepo $WERCKER_GIT_PUSH_REPO $cloneInto
