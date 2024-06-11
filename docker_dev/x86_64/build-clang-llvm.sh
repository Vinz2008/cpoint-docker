#!/usr/bin/env bash

set -ex


# Try to keep the LLVM version here in sync with src/ci/scripts/install-clang.sh
source ./vars.sh

# mkdir llvm-project
cd llvm-project

#curl -L https://github.com/llvm/llvm-project/archive/$LLVM.tar.gz | \
#  tar xzf - --strip-components=1

mkdir clang-build
cd clang-build

# For whatever reason the default set of include paths for clang is different
# than that of gcc. As a result we need to manually include our sysroot's
# include path, /rustroot/include, to clang's default include path.
#INC="/build/cpoint-root/include:/usr/include"

# We need compiler-rt for the profile runtime (used later to PGO the LLVM build)
# but sanitizers aren't currently building. Since we don't need those, just
# disable them. BOLT is used for optimizing LLVM.
cmake ../llvm \
    -G "Ninja" \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/ \
    -DCOMPILER_RT_BUILD_SANITIZERS=OFF \
    -DCOMPILER_RT_BUILD_XRAY=OFF \
    -DCOMPILER_RT_BUILD_MEMPROF=OFF \
    -DLLVM_TARGETS_TO_BUILD=X86 \
    -DLLVM_INCLUDE_BENCHMARKS=OFF \
    -DLLVM_INCLUDE_TESTS=OFF \
    -DLLVM_INCLUDE_DOCS=OFF \
    -DLLVM_INCLUDE_EXAMPLES=OFF \
    -DLLVM_ENABLE_PROJECTS="clang;lld;compiler-rt;bolt" \
    -DLLVM_BUILD_LLVM_DYLIB=ON \
    -DLLVM_LINK_LLVM_DYLIB=ON \
#    -DCMAKE_INSTALL_PREFIX=/build/cpoint-root \
#    -DCMAKE_C_COMPILER=/build/cpoint-root/bin/gcc \
#    -DCMAKE_CXX_COMPILER=/build/cpoint-root/bin/g++ \
#    -DC_INCLUDE_DIRS="$INC"

ninja
ninja install
#ninja install-distribution
#make -j$(nproc)
#make install

cd ../..
rm -rf llvm-project
