#!/usr/bin/env bash

set -ex

source ./vars.sh

cd gcc
sed -i 's|\-Werror||g' libbacktrace/configure

ARCH=x86_64-w64-mingw32

mkdir -p build && cd build
$ARCH-configure  --target=${ARCH} --prefix=/usr --libexecdir=/usr/lib \
    --enable-languages=ada,c,c++,fortran,lto,objc,obj-c++ \
    --enable-shared --enable-static \
    --enable-threads=posix --enable-fully-dynamic-string \
    --enable-libstdcxx-time=yes --enable-libstdcxx-filesystem-ts=yes \
    --with-system-zlib --enable-cloog-backend=isl \
    --enable-lto --enable-libgomp \
    --disable-multilib --enable-checking=release \
    --disable-sjlj-exceptions --with-dwarf2 \
    ..
make -j$(nproc)
make install
ln -s ${ARCH}-gcc /usr/bin/${ARCH}-cc
mkdir -p /usr/${ARCH}/bin/
cp /usr/${ARCH}/lib/*.dll /usr/${ARCH}/bin/