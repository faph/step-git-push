#!/bin/sh
WARN_COLOR=$(tput setaf 3 ; tput bold)
SUCCESS_COLOR=$(tput setaf 2 ; tput bold)
ERROR_COLOR=$(tput setaf 1 ; tput bold)
INFO_COLOR=$(tput setaf 8 ; tput bold )
DEBUG_COLOR=$(tput setaf 8 ; tput bold)
RESET_COLOR=$(tput sgr0)

_message() {
  msg=$1
  color=$2
  echo -e "${color}${msg}${RESET_COLOR}"
}

success() {
  _message "${1}" $SUCCESS_COLOR
}

info() {
  _message "${1}" $INFO_COLOR
}

debug() {
  _message "${1}" $DEBUG_COLOR
}

warn() {
  _message "${1}" $WARN_COLOR
}

error() {
  _message "error: ${1}" $ERROR_COLOR
}

fail() {
  _message "failed: ${1}" $ERROR_COLOR
  echo "${1}" > "$WERCKER_REPORT_MESSAGE_FILE"
  exit 1
}

setMessage() {
  echo "${1}" > "$WERCKER_REPORT_MESSAGE_FILE"
}

cloneRepo() {
  info "Cloning repo from ${1}, branch ${2} into ${3}."
  git clone --quiet --branch="${2}" $1 $3
}

copyFiles() {
  info "Copying all files in ${1} into ${2}."
  if $3 ; then
    info "Cleaning removed files first."
    # TODO
  fi
  cp --recursive --force "${1}"/* "${2}"
}

commitFiles() {
  local message="[ci skip] Commit from Wercker bot."
  local author="Wercker Bot <pleasemailus@wercker.com>"
  info "Committing all files in ${1}."
  pushd "${1}" > /dev/null
  git add --verbose .
  git commit --message="${message}" --author="${author}"
  local exitcode="$?"
  debug "Commit completed with exit code ${exitcode}."
  popd > /dev/null
  return $exitcode
}

pushFiles() {
  info "Pushing all files in ${1} to repo ${2}, branch ${3}."
  pushd "${1}" > /dev/null
  git push --verbose ${2} ${3}
  popd > /dev/null
}

tempDirName() {
  local d="/tmp/step-git-push-repo"
  rm -rf "${d}"
  echo "${d}"
}

# Make sure we fail on all errors
#set -e
#set -o pipefail
