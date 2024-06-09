#!/bin/bash
set -ex

source ./vars.sh

#mkdir tomlplusplus
cd tomlplusplus
#curl -L https://github.com/marzer/tomlplusplus/archive/refs/tags/v$TOMLPLUSPLUS.tar.gz | \
#  tar xzf - --strip-components=1
cp -r include/toml++ /usr/include


cd ..
rm -rf tomlplusplus