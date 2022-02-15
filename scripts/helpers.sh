#! /bin/bash


function is_number() {
  local value=$1
  grep -q "^[0-9]*$" <<< $value
}

function is_reg() {
    local reg=$1

    local registers="A B C D"
    grep -q "$reg" <<< $registers
}

function get_reg_value() {
    local reg=$1

    echo "${!reg}"
}

function refine_arg() {
  local arg=$1
  
  echo ${arg:0:1}
}

function reset_reg() {
  A=0
  B=0
  C=0
  D=0 
}

function display_reg() {
  echo "A : $A B : $B C : $C D : $D"
}