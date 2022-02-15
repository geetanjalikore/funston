#! /bin/bash

source tests/generate_report.sh
source tests/general_test_functions.sh
source tests/test_commands.sh
source tests/test_helpers.sh

function run_all_tests() {
  local test_cases=( $(get_test_cases "tests/test_helpers.sh" "tests/test_commands.sh") )

  OLDIFS=${IFS}
	IFS=$'\n'
  
  for test_case in ${test_cases[@]}
  do  
    $test_case
  done

	IFS=${OLDIFS}
}

function test_library() {
	run_all_tests
	
	OLDIFS=${IFS}
	IFS=$'\n'
	local tests=($(get_tests))
	IFS=${OLDIFS}
	
	generate_report "${tests[@]}"
}

test_library