#!/bin/sh

THIS_FILE_PATH=$(
  cd $(dirname $0)
  pwd
)
THIS_FILE_NAME=$(basename $0)
RUN_SCRIPT_PATH="$THIS_FILE_PATH"

###
# deps
###
#source "$THIS_FILE_PATH/sh-lib-path-resolve.sh"
# -[x] path_resolve

###
# apis
###
function project_dir_map(){
  local p=
  local b=
  [ "${1}" ] && b="${1}"
  [ -z "$b" ] && b="$THIS_FILE_PATH"

[ "${2}" ] && p="${2}"
  [ -z "$p" ] && p="../"

PROJECT_PATH=$(path_resolve "$b" "$p")
SRC_PATH=$(path_resolve "$PROJECT_PATH" "src")
NOTE_PATH=$(path_resolve "$PROJECT_PATH" "note")
BUILD_PATH=$(path_resolve "$PROJECT_PATH" "build")
PACKAGE_PATH=$(path_resolve "$PROJECT_PATH" "packages")
HELP_DIR=$(path_resolve $PROJECT_PATH "help")
SRC_DIR=$(path_resolve $PROJECT_PATH "src")
TEST_DIR=$(path_resolve $PROJECT_PATH "test")
DIST_DIR=$(path_resolve $PROJECT_PATH "dist")
DOCS_DIR=$(path_resolve $PROJECT_PATH "docs")
TOOL_DIR=$(path_resolve $PROJECT_PATH "tool")
}
# project_dir_map
# project_dir_map "$THIS_FILE_PATH" "../"
project_dir_map
