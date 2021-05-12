#!/bin/bash

BR2_DIR="${PWD}/buildroot-2014.08"
OUT_DIR="${BR2_DIR}/output/images"
EXTRA_ARGS="-nographic -m 128"

exec qemu-system-sparc \
    -M SS-10 \
    -kernel ${OUT_DIR}/zImage \
    -initrd ${OUT_DIR}/rootfs.cpio \
    -append "rootwait console=ttyS0,115200" \
    -net nic,model=lance \
    -net user \
    ${EXTRA_ARGS}
