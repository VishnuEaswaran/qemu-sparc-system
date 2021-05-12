#!/bin/bash

WORKSPACE_DIR="${PWD}/workspace"
BR2_DIR="${PWD}/buildroot-2014.08"
OUT_DIR="${BR2_DIR}/output/images"

cd $BR2_DIR

make clean
make BR2_EXTERNAL=${WORKSPACE_DIR}/qemu_sparc_ss10_configs qemu_sparc_ss10_rootfs_defconfig
make && \
cp ${OUT_DIR}/rootfs.tar ${WORKSPACE_DIR}/overlay

# creating initramfs. cpio not embedded in linux
make BR2_EXTERNAL=${WORKSPACE_DIR}/qemu_sparc_ss10_configs qemu_sparc_ss10_initramfs_defconfig
make
