#!/bin/bash

# SPDX-License-Identifier: MIT
# SPDX-Author: Roman Koch <koch.romam@gmail.com>
# SPDX-Copyright: 2024 Roman Koch <koch.romam@gmail.com>

CURRENT_DIR=$(pwd)
SDK_DIR="${CURRENT_DIR}/build/deploy-ti/sdk/"
TARGET_DIR="/mnt/ssd/work/bbb-sdk"
#SDK_NAME="poky-glibc-x86_64-core-image-full-cmdline-armv7at2hf-neon-beaglebone-toolchain-4.0.24"

# Suche nach der passenden SDK-Installationsdatei
SDK_FILE=$(find "$SDK_DIR" -type f -name "poky-*.sh" | head -n 1)

if [ -z "$SDK_FILE" ]; then
    echo "Fehler: Keine passende SDK-Datei gefunden."
    exit 1
fi

# Funktion zur Sicherung des Verzeichnisses mit Zeitstempel-Erweiterung
backup_existing_dir() {
    local dir="$1"
    if [ -d "$dir" ]; then
        local timestamp=$(date +"%Y%m%d_%H%M%S")
        local backup_dir="${dir}.${timestamp}"
        mv "$dir" "$backup_dir"
        echo "Backup des bestehenden Verzeichnisses erstellt: $backup_dir"
    fi
}

# Backup des TARGET_DIR falls vorhanden
backup_existing_dir "$TARGET_DIR"

# Installiere das SDK
"${SDK_FILE}" -d "${TARGET_DIR}"
