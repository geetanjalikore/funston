#! /bin/bash
source scripts/helpers.sh
source scripts/commands.sh

function execute() {
  local command=$1
  local arg_1=$2
  local arg_2=$3

  arg_1=$( refine_arg $arg_1 )
  if [[ $command == "START" ]]
  then
    reset_reg
  elif [[ $command == "MOV" ]] && is_number $arg_2
  then
    mov_val_to_reg "${arg_1}" "$arg_2"
  elif [[ $command == "MOV" ]] && is_reg $arg_2
  then
    mov_reg_to_reg "${arg_1}" "$arg_2"
  elif [[ $command == "ADD" ]] && is_number $arg_2
  then
    add_val_to_reg "${arg_1}" "$arg_2"
  elif [[ $command == "ADD" ]] && is_reg $arg_2
  then
    add_reg_to_reg "${arg_1}" "$arg_2"
  elif [[ $command == "STOP" ]]
  then 
    exit
  fi

  display_reg
}