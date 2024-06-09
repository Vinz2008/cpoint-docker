#!/usr/bin/env bash

set -ex

#stolen from https://aur.archlinux.org/cgit/aur.git/tree/PKGBUILD?h=mingw-w64-cmake

ARCH=x86_64-w64-mingw32

mkdir cmake-temp
cd cmake-temp

wget "https://aur.archlinux.org/cgit/aur.git/plain/mingw-cmake.sh?h=mingw-w64-cmake" -O mingw-cmake.sh
wget "https://aur.archlinux.org/cgit/aur.git/plain/toolchain-mingw.cmake?h=mingw-w64-cmake" -O toolchain-mingw.cmake

sed "s|@TRIPLE@|${ARCH}|g;s|@PROCESSOR@|${ARCH::-12}|g;s|-gcc|-gcc-posix|g;s|-g++|-c++-posix|g" toolchain-mingw.cmake > toolchain-${ARCH}.cmake
sed "s|@TRIPLE@|${ARCH}|g" mingw-cmake.sh > ${ARCH}-cmake

mkdir -p /usr/share/mingw
install -m 644 toolchain-${ARCH}.cmake /usr/share/mingw/
install -m 755 ${ARCH}-cmake /usr/bin/

wget https://aur.archlinux.org/cgit/aur.git/plain/mingw-env.sh?h=mingw-w64-environment -O mingw-env
cp mingw-env /usr/bin

cd ..
#rm -rf cmake-temp