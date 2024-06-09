#!/bin/bash
set -ex

source ./vars.sh

#curl -L https://github.com/ninja-build/ninja/archive/refs/tags/v$NINJA.tar.gz | \
#  tar xzf -

cd ninja-$NINJA

./configure.py --bootstrap

install -vm755 ninja /usr/bin/

cd ..
rm -rf ninja-$NINJA