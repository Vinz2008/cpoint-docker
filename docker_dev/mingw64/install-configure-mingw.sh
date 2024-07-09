#!/usr/bin/env bash

set -ex

ARCH=x86_64-w64-mingw32

wget "https://aur.archlinux.org/cgit/aur.git/plain/mingw-configure.sh?h=mingw-w64-configure" -O mingw-configure.sh
sed "s|@TRIPLE@|${ARCH}|g" mingw-configure.sh > ${ARCH}-configure
install -m 755 ${ARCH}-configure /usr/bin/