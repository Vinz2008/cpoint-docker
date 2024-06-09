#!/usr/bin/env bash

set -ex

source ./vars.sh

mkdir llvm-project 
cd llvm-project
curl -L https://github.com/llvm/llvm-project/archive/$LLVM.tar.gz | \
  tar xzf - --strip-components=1
cd ..

mkdir tomlplusplus
cd tomlplusplus
curl -L https://github.com/marzer/tomlplusplus/archive/refs/tags/v$TOMLPLUSPLUS.tar.gz | \
  tar xzf - --strip-components=1
cd ..