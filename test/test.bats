#!/usr/bin/env bats

# Copyright (c) 2021 Jesús Lázaro
# 
# This software is released under the MIT License.
# https://opensource.org/licenses/MIT

function setup() {
    load '/home/linuxbrew/.linuxbrew/lib/bats-support/load.bash'
    load '/home/linuxbrew/.linuxbrew/lib/bats-assert/load.bash'
}

@test "Single file, no subfunctions" {
    run ./test_file_1.sh

    assert_line -n 0 '(./test_file_1.sh,main) 16: test_a - string'
    assert_line -n 1 '(./test_file_1.sh,main) 17: test_a - string'
    assert_line -n 2 '(./test_file_1.sh,main) 18: test_b - string_a string_b string_c'
    assert_line -n 3 '(./test_file_1.sh,main) 19: test_b - string_a string_b string_c'
    assert_line -n 4 '(./test_file_1.sh,main) 20: test_c - 5'
    assert_line -n 5 '(./test_file_1.sh,main) 21: test_c - 5'
    assert_line -n 6 '(./test_file_1.sh,main) 22: test_d - stringab string_aa'
    assert_line -n 7 '(./test_file_1.sh,main) 23: test_d - stringab string_aa'
}

@test "Single file, subfunctions" {
    run ./test_file_2.sh
    assert_line -n 0 '(./test_file_2.sh,test) 16: test_a - string'
    assert_line -n 1 '(./test_file_2.sh,main) 26: (./test_file_2.sh,test) 17: test_a - string'
    assert_line -n 2 '(./test_file_2.sh,test) 18: test_b - string_a string_b string_c'
    assert_line -n 3 '(./test_file_2.sh,main) 26: (./test_file_2.sh,test) 19: test_b - string_a string_b string_c'
    assert_line -n 4 '(./test_file_2.sh,test) 20: test_c - 5'
    assert_line -n 5 '(./test_file_2.sh,main) 26: (./test_file_2.sh,test) 21: test_c - 5'
    assert_line -n 6 '(./test_file_2.sh,test) 22: test_d - stringab string_aa'
    assert_line -n 7 '(./test_file_2.sh,main) 26: (./test_file_2.sh,test) 23: test_d - stringab string_aa'
}

@test "Two files, with subfunctions" {
    run ./test_file_3a.sh
    assert_line -n 0 '(./test_file_3b.sh,test) 17: test_a - string'
    assert_line -n 1 '(./test_file_3a.sh,main) 10: (./test_file_3b.sh,test) 18: test_a - string'
    assert_line -n 2 '(./test_file_3b.sh,test) 19: test_b - string_a string_b string_c'
    assert_line -n 3 '(./test_file_3a.sh,main) 10: (./test_file_3b.sh,test) 20: test_b - string_a string_b string_c'
    assert_line -n 4 '(./test_file_3b.sh,test) 21: test_c - 5'
    assert_line -n 5 '(./test_file_3a.sh,main) 10: (./test_file_3b.sh,test) 22: test_c - 5'
    assert_line -n 6 '(./test_file_3b.sh,test) 23: test_d - stringab string_aa'
    assert_line -n 7 '(./test_file_3a.sh,main) 10: (./test_file_3b.sh,test) 24: test_d - stringab string_aa'
}