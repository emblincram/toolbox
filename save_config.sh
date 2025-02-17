#!/bin/bash

# SPDX-License-Identifier: MIT
# SPDX-Author: Roman Koch <koch.romam@gmail.com>
# SPDX-Copyright: 2024 Roman Koch <koch.romam@gmail.com>

CONFIG_BACKUP_DIR="./config.backup"
TIMESTAMP=$(date +%Y%m%d_%H%M%S)

mkdir -p "$CONFIG_BACKUP_DIR"
cp poky/build/conf/local.conf "$CONFIG_BACKUP_DIR/local.conf_$TIMESTAMP"
cp poky/build/conf/bblayers.conf "$CONFIG_BACKUP_DIR/bblayers.conf_$TIMESTAMP"
echo "Configs gesichert nach $CONFIG_BACKUP_DIR"
