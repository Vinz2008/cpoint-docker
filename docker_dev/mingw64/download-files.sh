#!/usr/bin/env bash

set -ex

source ./vars.sh

mkdir llvm-project 
cd llvm-project
curl -L https://github.com/llvm/llvm-project/archive/$LLVM.tar.gz | \
  tar xzf - --strip-components=1
cd ..

curl -L https://github.com/Kitware/CMake/releases/download/v$CMAKE/cmake-$CMAKE.tar.gz | tar xzf -

mkdir tomlplusplus
cd tomlplusplus
curl -L https://github.com/marzer/tomlplusplus/archive/refs/tags/v$TOMLPLUSPLUS.tar.gz | \
  tar xzf - --strip-components=1
cd ..


curl -L https://ftp.gnu.org/pub/gnu/libiconv/libiconv-$ICONV.tar.gz | \
  tar xzf -
curl -L http://ftp.gnu.org/pub/gnu/gettext/gettext-$GETTEXT.tar.gz | \
  tar xzf - 