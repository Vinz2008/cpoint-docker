#!/bin/bash
set -ex

source ./vars.sh

ARCH=x86_64-w64-mingw32

# # install configure wrapper
# wget "https://aur.archlinux.org/cgit/aur.git/plain/mingw-configure.sh?h=mingw-w64-configure" -O mingw-configure.sh
# sed "s|@TRIPLE@|${ARCH}|g" mingw-configure.sh > ${ARCH}-configure
# install -m 755 ${ARCH}-configure /usr/bin/

cd libiconv-$ICONV
mkdir -p build
cd build
${ARCH}-configure --disable-nls
make -j$(nproc)
make install -j1
cd ../..
rm -rf libiconv-$ICONV

cd gettext-$GETTEXT
mkdir build
cd build
#export MINGW_LDFLAGS="-Wl,--enable-auto-import"
LDFLAGS="-lssp" ${ARCH}-configure \
      --disable-java \
      --disable-native-java \
      --disable-csharp \
      --enable-threads=posix \
      --without-emacs ..
make
# make -j$(nproc)
make install
cd ../..
rm -rf gettext-$GETTEXT