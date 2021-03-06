#!/bin/bash
    set -x

    export ARCH=arm64

    export PATH=/home/devries/aarch64-linux-gnu-5.3:$PATH

    export PATH=/home/devries/GitHub/mkbootimg_tools:$PATH

    export CROSS_COMPILE=/home/devries/aarch64-linux-gnu-5.3/bin/aarch64-

    make exynos7420-zerofltetw_defconfig

    make -j7 2>&1 |tee build.txt

mkbootimg \
      --kernel arch/arm64/boot/Image \
      --ramdisk ramdisk.packed \
      --base 0x10000000 \
      --pagesize 2048 \
      --dt dt.img \
      --ramdisk_offset 0x01000000 \
      --tags_offset 0x00000100 \
      --output boot.img