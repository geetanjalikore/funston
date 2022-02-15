source scripts/commands.sh

function test_mov_val_to_reg() {
    local test_description=$1
    local expected=$2
    local reg=$3
    local value=$4

    local return_status
    mov_val_to_reg $reg $value
    return_status=$?
    local actual
    if [[ $return_status -ne 0 ]]; then
        actual=$return_status
    else
        actual=$( get_reg_value $reg )
    fi
    local test_result=$( verify_expectations "$actual" "$expected" )
    append_test_case $test_result "mov_val_to_reg|$test_description|$inputs|$expected|$actual"
}

function test_cases_mov_val_to_reg() {
    local test_description="should move literal value to A register"
    local expected=5
    local reg="A"
    local value=5
    test_mov_val_to_reg "$test_description" "$expected" "$reg" "$value"

    test_description="should move literal value to B register"
    expected=4
    reg="B"
    value=4
    test_mov_val_to_reg "$test_description" "$expected" "$reg" "$value"

    test_description="should move literal value to C register"
    expected=3
    reg="C"
    value=3
    test_mov_val_to_reg "$test_description" "$expected" "$reg" "$value"

    test_description="should move literal value to D register"
    expected=2
    reg="D"
    value=2
    test_mov_val_to_reg "$test_description" "$expected" "$reg" "$value"

    test_description="should give error for invalid register"
    expected="1"
    reg="E"
    value=3
    test_mov_val_to_reg "$test_description" "$expected" "$reg" "$value"

    test_description="should give error for invalid value"
    expected="1"
    reg="A"
    value="G"

    test_mov_val_to_reg "$test_description" "$expected" "$reg" "$value"
}

function test_mov_reg_to_reg() {
    local test_description=$1
    local expected=$2
    local reg_1=$3
    local reg_2=$4

    local return_status
    mov_reg_to_reg $reg_1 $reg_2
    return_status=$?
    local actual
    if [[ $return_status -ne 0 ]]; then
        actual=$return_status
    else
        actual=$( get_reg_value $reg_1 )
    fi
    local test_result=$( verify_expectations "$actual" "$expected" )
    append_test_case $test_result "mov_reg_to_reg|$test_description|$inputs|$expected|$actual"
}

function test_cases_mov_reg_to_reg() {
    local test_description="should move value of given register to A"
    local expected=5
    local reg_1="A"
    local reg_2="B"
    mov_val_to_reg ${reg_2} 5
    test_mov_reg_to_reg "$test_description" "$expected" "$reg_1" "$reg_2"

    test_description="should move value of given register to B"
    expected=5
    reg_1="B"
    reg_2="A"
    mov_val_to_reg ${reg_2} 5
    test_mov_reg_to_reg "$test_description" "$expected" "$reg_1" "$reg_2"

    test_description="should move value of given register to C"
    expected=5
    reg_1="C"
    reg_2="A"
    mov_val_to_reg ${reg_2} 5
    test_mov_reg_to_reg "$test_description" "$expected" "$reg_1" "$reg_2"

    test_description="should move value of given register to D"
    expected=5
    reg_1="D"
    reg_2="A"
    mov_val_to_reg ${reg_2} 5
    test_mov_reg_to_reg "$test_description" "$expected" "$reg_1" "$reg_2"

    test_description="should give error if target register is invalid"
    expected=1
    reg_1="E"
    reg_2="A"
    mov_val_to_reg ${reg_2} 5
    test_mov_reg_to_reg "$test_description" "$expected" "$reg_1" "$reg_2"

    test_description="should give error if source register is invalid"
    expected=1
    reg_1="B"
    reg_2="E"
    test_mov_reg_to_reg "$test_description" "$expected" "$reg_1" "$reg_2"
}

function test_add_val_to_reg() {
    local test_description=$1
    local expected=$2
    local reg=$3
    local value=$4

    local return_status
    add_val_to_reg $reg $value
    return_status=$?
    local actual
    if [[ $return_status -ne 0 ]]; then
        actual=$return_status
    else
        actual=$( get_reg_value $reg )
    fi
    local test_result=$( verify_expectations "$actual" "$expected" )
    append_test_case $test_result "add_val_to_reg|$test_description|$inputs|$expected|$actual"
}

function test_cases_add_val_to_reg() {
    local test_description="should add literal value to A register"
    local expected=4
    local reg="A"
    local value=2
    mov_val_to_reg $reg $value
    test_add_val_to_reg "$test_description" "$expected" "$reg" "$value"

    test_description="should add literal value to B register"
    expected=3
    reg="B"
    value=1
    mov_val_to_reg $reg 2
    test_add_val_to_reg "$test_description" "$expected" "$reg" "$value"

    test_description="should add literal value to C register"
    expected=4
    reg="C"
    value=3
    mov_val_to_reg $reg 1
    test_add_val_to_reg "$test_description" "$expected" "$reg" "$value"

    test_description="should add literal value to D register"
    expected=7
    reg="D"
    value=2
    mov_val_to_reg $reg 5
    test_add_val_to_reg "$test_description" "$expected" "$reg" "$value"

    test_description="should give error for invalid register"
    expected="1"
    reg="E"
    value=3
    test_add_val_to_reg "$test_description" "$expected" "$reg" "$value"
}

function test_add_reg_to_reg() {
    local test_description=$1
    local expected=$2
    local reg_1=$3
    local reg_2=$4

    local return_status
    add_reg_to_reg $reg_1 $reg_2
    return_status=$?
    local actual
    if [[ $return_status -ne 0 ]]; then
        actual=$return_status
    else
        actual=$( get_reg_value $reg_1 )
    fi
    local test_result=$( verify_expectations "$actual" "$expected" )
    append_test_case $test_result "add_reg_to_reg|$test_description|$inputs|$expected|$actual"
}

function test_cases_add_reg_to_reg() {
    local test_description="should add value of given register to A and store result in A"
    local expected=2
    local reg_1="A"
    local reg_2="B"
    mov_val_to_reg ${reg_1} 1
    mov_val_to_reg ${reg_2} 1
    test_add_reg_to_reg "$test_description" "$expected" "$reg_1" "$reg_2"
    
    test_description="should add value of given register to B and store result in B"
    expected=3
    reg_1="B"
    reg_2="A"
    mov_val_to_reg ${reg_1} 1
    mov_val_to_reg ${reg_2} 2
    test_add_reg_to_reg "$test_description" "$expected" "$reg_1" "$reg_2"
    
    test_description="should add value of given register to C and store result in C"
    expected=5
    reg_1="C"
    reg_2="A"
    mov_val_to_reg ${reg_1} 3
    mov_val_to_reg ${reg_2} 2
    test_add_reg_to_reg "$test_description" "$expected" "$reg_1" "$reg_2"
    
    test_description="should add value of given register to D and store result in D"
    expected=6
    reg_1="D"
    reg_2="A"
    mov_val_to_reg ${reg_1} 2
    mov_val_to_reg ${reg_2} 4
    test_add_reg_to_reg "$test_description" "$expected" "$reg_1" "$reg_2"
    
    test_description="should give error if target register is invalid"
    expected=1
    reg_1="E"
    reg_2="A"
    mov_val_to_reg ${reg_2} 5
    test_add_reg_to_reg "$test_description" "$expected" "$reg_1" "$reg_2"

    test_description="should give error if source register is invalid"
    expected=1
    reg_1="B"
    reg_2="E"
    test_add_reg_to_reg "$test_description" "$expected" "$reg_1" "$reg_2"    
}