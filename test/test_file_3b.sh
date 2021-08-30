#! /usr/bin/env bash

# Copyright (c) 2021 Jesús Lázaro
# 
# This software is released under the MIT License.
# https://opensource.org/licenses/MIT

source ../src/ic.sh


test () {
declare test_a="string"
declare -a test_b=("string_a" "string_b" "string_c")
declare -i test_c=5
declare -A test_d=([first_string]=string_aa [second_string]=stringab) 

ic test_a
ict test_a
ic test_b
ict test_b
ic test_c
ict test_c
ic test_d
ict test_d
}
