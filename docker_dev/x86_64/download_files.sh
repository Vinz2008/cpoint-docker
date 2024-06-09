#!/usr/bin/env bash

set -ex

source ./vars.sh

curl https://ftp.gnu.org/gnu/gcc/gcc-$GCC/gcc-$GCC.tar.xz | xzcat | tar xf -

curl -L https://github.com/Kitware/CMake/releases/download/v$CMAKE/cmake-$CMAKE.tar.gz | tar xzf -

curl -L https://github.com/ninja-build/ninja/archive/refs/tags/v$NINJA.tar.gz | \
  tar xzf -

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