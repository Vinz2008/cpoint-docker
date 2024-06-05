#!/bin/bash
set -ex

mkdir tomlplusplus
cd tomlplusplus
curl -L https://github.com/marzer/tomlplusplus/archive/refs/tags/v3.4.0.tar.gz | \
  tar xzf - --strip-components=1
cp -r include/toml++ /usr/include


cd ..
rm -rf tomlplusplus