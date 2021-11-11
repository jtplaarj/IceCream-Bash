<!--
 Copyright (c) 2021 Jesús Lázaro
 
 This software is released under the MIT License.
 https://opensource.org/licenses/MIT
-->
![GitHub](https://img.shields.io/github/license/jtplaarj/IceCream-Bash)

# IceCream-bash - Never use `echo` to debug again

## Overview

Simple implementation of [IceCream](https://github.com/gruns/icecream) for [Bash](https://www.gnu.org/software/bash/).

* This project aims to:
  * Print the value of a variable as well as the position in the program.
  * Work with normal variables, arrays and associative arrays (only values are printed, not keys).

An example output from the [test file 1](test/test_file_1.sh) is:

```bash
(./test_file_1.sh,main) 16: test_a - string
(./test_file_1.sh,main) 17: test_a - string
(./test_file_1.sh,main) 18: test_b - string_a string_b string_c
(./test_file_1.sh,main) 19: test_b - string_a string_b string_c
(./test_file_1.sh,main) 20: test_c - 5
(./test_file_1.sh,main) 21: test_c - 5
(./test_file_1.sh,main) 22: test_d - stringab string_aa
(./test_file_1.sh,main) 23: test_d - stringab string_aa
```

## How do I use it?

### Requirements

This script has been tested in Bash v5. Comments about issues in other versions are welcomed.

### Installation

There are two ways to include this commands in your script:

1. Source `ic.sh` in your script:

```bash
source ic.sh
```

2. Just copy the content of the script to your script.

### Usage

This project provides two different commands:

1. `ic` prints the line, file name, function name, name of variable and value.
2. `ict` prints all the call tree.
3. The `icp` and `ictp` variants just print a message string, with similar line preambles.

The usage in both cases is the same:

```bash
variable="hello"
ict variable
ic variable
```

Several examples can be found in the [test](test/) subdir.

### Test

There is a test suite with example. It has been done using the [Bats-core](https://github.com/bats-core/bats-core) testing framework for Bash.

## IceCream in Other Languages

Delicious IceCream should be enjoyed in every language.

* Python: [IceCream](https://github.com/gruns/icecream)
* Dart: [icecream](https://github.com/HallerPatrick/icecream)
* Rust: [icecream-rs](https://github.com/ericchang00/icecream-rs)
* Node.js: [node-icecream](https://github.com/jmerle/node-icecream)
* C++: [IceCream-Cpp](https://github.com/renatoGarcia/icecream-cpp)
* C99: [icecream-c](https://github.com/chunqian/icecream-c)
* PHP: [icecream-php](https://github.com/ntzm/icecream-php)
* Go: [icecream-go](https://github.com/WAY29/icecream-go)
* Ruby: [Ricecream](https://github.com/nodai2hITC/ricecream)
* Java: [icecream-java](https://github.com/Akshay-Thakare/icecream-java)
* R: [icecream](https://github.com/lewinfox/icecream)
* Lua: [icecream-lua](https://github.com/wlingze/icecream-lua)
* Clojure(Script): [icecream-cljc](https://github.com/Eigenbahn/icecream-cljc)

## License

This library is free software; you can redistribute it and/or modify it under
the terms of the MIT license. See [LICENSE](LICENSE) for details.
