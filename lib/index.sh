#!/bin/sh

mod_dic_name=load_lib_dic

# get cache dic var name by md5
[ -z "$hash" ] && hash=$(echo -n "$mod_dic_name"| md5sum | cut -d ' ' -f1 |cut -c 1-6 | grep "^[a-zA-Z]" )
# get cache dic var name by base64
[ -z "$hash" ] && hash=$(echo -n "$mod_dic_name"| base64 | cut -d ' ' -f1| cut -c 1-6 | grep "^[a-zA-Z]" )
# get cache dic var name by md5,base64
[ -z "$hash" ] && hash=$(echo -n "$mod_dic_name" | base64 | md5sum | cut -d ' ' -f1 | cut -c 1-6 | grep "^[a-zA-Z]" )
#[ -z "$hash" ] && echo "warn:$mod_dic_name 's name init fails!"
[ -z "$hash" ] && hash="dic$(date +'%Y%m%d%H%M%S')"
#echo "$hash"

#eval "declare -A $hash ; $hash=()"
declare -A db1e4d ; db1e4d=()

function lib_ini() {
  declare -A db1e4d ; db1e4d=()
}

function lib_has() {
  local val=
  local key=
  local res=
  local dic=
  res="false"
  [ "$1" ] && key="$1"
  val="${db1e4d[$key]}"
  #[ _"$val" != _"" ] && res="true"
  [ "$val" ] && res="true"
  #[ _"$val" = _"false" ]  && [ -e "$key" ] && res="true"
  echo "$res"
}

function lib_load() {
  local key=
  [ "$1" ] && key="$1"
  lib_require "$key"
  local IS_TRUE=
  IS_TRUE="${db1e4d[$key]}"
  #echo "source \"$key\""
  #[ _"$IS_TRUE = _"true" ]  && [ -e "$key" ] && eval "source \"$key\""
  #[ _"$IS_TRUE = _"true" ]  && [ -e "$key" ] && source "$key"
  [ _"$IS_TRUE" = _"true" ]  && [ -e "$key" ] && . "$key"
}

function lib_require() {
  local val=
  local key=
  [ "$1" ] && key="$1"
  #val="${db1e4d[$key]}"
  #local IS_TRUE=
  #IS_TRUE=$(lib_has "$key")
  #[ _"$IS_TRUE" != _"true" ] && [ -z "$val" ] && [ -e "$val" ] && db1e4d+=(["$key"]="true")
  [ -e "$key" ] && db1e4d+=(["$key"]="true")
}

function lib_check() {
  local key=
  [ "$1" ] && key="$1"
  [ ! -e "$key" ] && echo "warn:lib not exists" && exit 1
}


# file usage
# ./src/index.sh
