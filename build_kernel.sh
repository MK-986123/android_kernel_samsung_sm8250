#!/bin/bash

export ARCH=arm64
mkdir out

KERNEL_LLVM_BIN=$(pwd)/toolchain/qcom_llvm/10.0/bin/clang
CLANG_TRIPLE=aarch64-linux-gnu-
KERNEL_MAKE_ENV=""

make -j8 -C $(pwd) O=$(pwd)/out CONFIG_BUILD_ARM64_DT_OVERLAY=y $KERNEL_MAKE_ENV ARCH=arm64 REAL_CC=$KERNEL_LLVM_BIN CLANG_TRIPLE=$CLANG_TRIPLE z3q_usa_singlew_defconfig
make -j8 -C $(pwd) O=$(pwd)/out CONFIG_BUILD_ARM64_DT_OVERLAY=y $KERNEL_MAKE_ENV ARCH=arm64 REAL_CC=$KERNEL_LLVM_BIN CLANG_TRIPLE=$CLANG_TRIPLE
 
cp out/arch/arm64/boot/Image $(pwd)/arch/arm64/boot/Image
