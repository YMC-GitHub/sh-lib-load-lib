#!/bin/sh

THIS_FILE_PATH=$(cd $(dirname $0);pwd)
THIS_FILE_NAME=$(basename $0)

source "$THIS_FILE_PATH/sh-lib-path-resolve.sh"
source "$THIS_FILE_PATH/sh-lib-project-dir-map.sh"
source "$THIS_FILE_PATH/sh-lib-test.sh"
source "$THIS_FILE_PATH/sh-lib-time-cost.sh"
source "$SRC_PATH/index.sh"

COST_TIME_LABEL="load-lib.curd.cost"

recordTime "$COST_TIME_LABEL"


function test_unit_next(){
  #lib_check  "${THIS_FILE_PATH}/config.sh"
  echo "----------unit.test:lib_check------"
  test "lib_check \"${THIS_FILE_PATH}/config.sh\"" "warn:lib not exists"
  test "lib_check \"${THIS_FILE_PATH}/sh-lib-hi.sh\"" ""
  echo
  echo "----------unit.test:lib_require------"
  test "lib_require \"${THIS_FILE_PATH}/config.sh\"" ""
  test "lib_require \"${THIS_FILE_PATH}/sh-lib-hi.sh\"" ""
  echo
  echo "----------unit.test:lib_has------"
  test "lib_has \"${THIS_FILE_PATH}/config.sh\"" "false"
  test "lib_has \"${THIS_FILE_PATH}/sh-lib-hi.sh\"" "true"
  echo
  echo "----------unit.test:lib_load------"
  test "lib_load \"${THIS_FILE_PATH}/config.sh\"" ""
  test "lib_load \"${THIS_FILE_PATH}/sh-lib-hi.sh\"" "hi,shell!"

}

function sample_01(){
  lib_has "${THIS_FILE_PATH}/config.sh" # false
  lib_require "${THIS_FILE_PATH}/sh-lib-hi.sh"
  #lib_has "${THIS_FILE_PATH}/sh-lib-hi.sh"
  lib_load "${THIS_FILE_PATH}/sh-lib-hi.sh"
}

function sample_02(){
  lib_has "${THIS_FILE_PATH}/config.sh" # false
  lib_load "${THIS_FILE_PATH}/sh-lib-hi.sh"
}

function sample_03(){
  lib_has "${THIS_FILE_PATH}/sh-lib-hi.sh" # false
  lib_load "${THIS_FILE_PATH}/sh-lib-hi.sh"
  hi "how are you"
}
function exp(){
  #topic=$(echo "$2" | cut -d "|" -f 2)
  #exp=$(echo "$2" | cut -d "|" -f 1)
  echo "$1" | grep "$2" > /dev/null
  [ $? -eq 0 ] && echo "$3:ok"
  #echo "$1"
}

# $1 函数名
# $[2,] 传递给$1函数的参数
function magic_fun(){
	function_name=$1
	shift
	$function_name "$line" $@
}


function test_unit(){
  echo "----------unit.test:lib_check------"
  #desc="lib_check \"${THIS_FILE_PATH}/config.sh\""
  #$desc | exp "warn:lib not exists" "$desc"
  #lib_check "${THIS_FILE_PATH}/config.sh"
  lib_check "${THIS_FILE_PATH}/sh-lib-hi.sh"
  echo
  echo "----------unit.test:lib_require------"
  lib_require "${THIS_FILE_PATH}/config.sh"
  lib_require "${THIS_FILE_PATH}/sh-lib-hi.sh"
  echo
  echo "----------unit.test:lib_has------"
  lib_has "${THIS_FILE_PATH}/config.sh"
  lib_has "${THIS_FILE_PATH}/sh-lib-hi.sh"
  echo
  echo "----------unit.test:lib_load------"
  lib_load "${THIS_FILE_PATH}/config.sh"
  lib_load "${THIS_FILE_PATH}/sh-lib-hi.sh"
}
test_unit
caculateTime "$COST_TIME_LABEL"

## file-usage
# ./test/index.sh
