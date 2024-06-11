#!/bin/bash
set -ex

source ./vars.sh

mkdir cmake-build
cd cmake-build
../cmake-$CMAKE/configure
make -j$(nproc)
make install

cd ..
rm -rf cmake-build
rm -rf cmake-$CMAKE