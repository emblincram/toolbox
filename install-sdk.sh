#/bin/bash

# SPDX-License-Identifier: MIT
# SPDX-Author: Roman Koch <koch.romam@gmail.com>
# SPDX-Copyright: 2024 Roman Koch <koch.romam@gmail.com>

CURRENT_DIR=`pwd`
SDK_DIR=${CURRENT_DIR}/build/deploy-ti/sdk/
TARGET_DIR=/mnt/ssd/work/bbb-sdk
SDK_NAME=poky-glibc-x86_64-core-image-full-cmdline-armv7at2hf-neon-beaglebone-toolchain-4.0.24


${SDK_DIR}/${SDK_NAME}.sh -d ${TARGET_DIR}

#cp start_sdk.sh 
#source /mnt/ssd/yocto/bbb-sdk/site-config-armv7at2hf-neon-poky-linux-gnueabi
#poky-glibc-x86_64-core-image-full-cmdline-armv7at2hf-neon-beaglebone-toolchain-4.0.24.host.manifest
#poky-glibc-x86_64-core-image-full-cmdline-armv7at2hf-neon-beaglebone-toolchain-4.0.24.sh
#poky-glibc-x86_64-core-image-full-cmdline-armv7at2hf-neon-beaglebone-toolchain-4.0.24.target.manifest
#poky-glibc-x86_64-core-image-full-cmdline-armv7at2hf-neon-beaglebone-toolchain-4.0.24.testdata.json
