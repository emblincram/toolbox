#!/bin/bash

# SPDX-License-Identifier: MIT
# SPDX-Author: Roman Koch <koch.romam@gmail.com>
# SPDX-Copyright: 2024 Roman Koch <koch.romam@gmail.com>

sudo apt-get update

sudo apt-get install gawk wget git diffstat unzip texinfo gcc build-essential \
chrpath socat cpio python3 python3-pip python3-pexpect xz-utils debianutils \
iputils-ping libsdl1.2-dev xterm zstd liblz4-tool


git clone git://git.yoctoproject.org/poky
cd poky
git checkout kirkstone
cd ..

git clone git://git.yoctoproject.org/meta-ti
cd meta-ti
git checkout kirkstone
cd ..

cd poky
source oe-init-build-env
