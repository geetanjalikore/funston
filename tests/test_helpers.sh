source scripts/helpers.sh

function test_get_reg_value() {
    local test_description=$1
    local expected=$2
    local reg=$3

    local actual=$( get_reg_value $reg  )
    local test_result=$( verify_expectations "$actual" "$expected" )
    inputs="Register : $reg"
    append_test_case $test_result "get_reg_value|$test_description|$inputs|$expected|$actual"
}

function test_cases_get_reg_value() {
    local test_description="should give the value of the provided register"
    local expected=5
    local reg="A"
    A=5
    test_get_reg_value "$test_description" "$expected" "$reg"
}

function test_is_reg() {
    local test_description=$1
    local expected=$2
    local reg=$3

    local actual
    is_reg $reg
    actual=$?
    local test_result=$( verify_expectations "$actual" "$expected" )
    inputs="Register : $reg"
    append_test_case $test_result "is_reg|$test_description|$inputs|$expected|$actual"
}

function test_cases_is_reg() {
    local test_description="should validate provided register"
    local expected=0
    local reg="A"
    test_is_reg "$test_description" "$expected" "$reg"
    
    test_description="should return error status if the register is invalid"
    expected=1
    reg="E"
    test_is_reg "$test_description" "$expected" "$reg"
}

function test_refine_arg() {
    local test_description=$1
    local expected=$2
    local arg=$3

    local actual=$( refine_arg $arg )
    local test_result=$( verify_expectations "$actual" "$expected" )
    inputs="Argument : $arg"
    append_test_case $test_result "refine_arg|$test_description|$inputs|$expected|$actual"
}

function test_cases_refine_arg() {
    local test_description="should refine the argument"
    local expected="A"
    local arg="A,"
    test_refine_arg "$test_description" "$expected" "$arg"
}