#!/bin/bash

# SPDX-License-Identifier: MIT
# SPDX-Author: Roman Koch <koch.romam@gmail.com>
# SPDX-Copyright: 2024 Roman Koch <koch.romam@gmail.com>

set -e  # Stop on error

# Prüfen, ob genügend Argumente übergeben wurden
if [ "$#" -ne 2 ]; then
    echo "Usage: $0 <path/to/image.wic> <sd_card>"
    exit 1
fi

# Argumente
IMAGE_PATH=$1
SD_CARD=$2

# Sicherstellen, dass das Skript mit Root-Rechten ausgeführt wird
if [[ $EUID -ne 0 ]]; then
   echo "Bitte starte das Skript mit sudo oder als root."
   exit 1
fi

# Prüfen, ob die Image-Datei existiert
if [[ ! -f "$IMAGE_PATH" ]]; then
    echo "Fehler: Image-Datei $IMAGE_PATH nicht gefunden."
    exit 1
fi

# Bestätigen der Aktion
echo "WARNUNG: Alle Daten auf $SD_CARD werden überschrieben!"
echo "Möchtest du fortfahren? (ja/nein)"
read -r CONFIRMATION

if [[ "$CONFIRMATION" != "ja" ]]; then
    echo "Abbruch."
    exit 0
fi

# SD-Karte unmounten, falls gemountet
umount ${SD_CARD}* 2>/dev/null || true

# Image auf die SD-Karte schreiben
echo "Schreibe Image auf $SD_CARD ..."
dd if="$IMAGE_PATH" of="$SD_CARD" bs=4M status=progress
sync

echo "Fertig! SD-Karte kann entfernt werden."
