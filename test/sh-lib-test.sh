#!/bin/sh

function test() {
  local fn=
  local expectValue=
  local ouput=
  fn=${1}
  ouput=$(eval "$fn")
  expectValue=${2}
  echo "test:$fn"
  if [ "$ouput" = "$expectValue" ]; then
    echo "it is ok"
  else
    echo "it is false.expect $ouput = $expectValue"
  fi
}
# test 'fn_name "arg1" "arg2"' "expect_value"