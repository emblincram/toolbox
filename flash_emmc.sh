#!/bin/bash

# SPDX-License-Identifier: MIT
# SPDX-Author: Roman Koch <koch.romam@gmail.com>
# SPDX-Copyright: 2024 Roman Koch <koch.romam@gmail.com>

# Prüfen, ob genügend Argumente übergeben wurden
if [ "$#" -ne 1 ]; then
    echo "Usage: $0 <path/to/image.wic> <BBB-IP>"
    nmap -sn 192.168.0.0/24
    exit 1
fi

IMAGE_PATH=build/sd-card/
FILENAME=`ls ${IMAGE_PATH}/*.wic`

echo "image ${FILENAME}"

# Argumente
BBB_IP=$1

# Prüfen, ob die Image-Datei existiert
if [[ ! -f "$FILENAME" ]]; then
    echo "Fehler: Image-Datei $IMAGE_PATH nicht gefunden."
    exit 1
fi

# Bestätigen der Aktion
echo "Das Image $FILENAME wird auf das BeagleBone Black unter $BBB_IP geflasht."
read -p "Fortfahren? (y/n): " confirm
if [[ "$confirm" != "y" ]]; then
    echo "Abbruch."
    exit 0
fi

# Flashen des Images
echo "Starte den Flash-Vorgang..."
ssh -o StrictHostKeyChecking=no -o UserKnownHostsFile=/dev/null root@"$BBB_IP" "dd of=/dev/mmcblk1 bs=4M" < "$FILENAME"

# Prüfen, ob der Befehl erfolgreich war
if [ $? -eq 0 ]; then
    echo "Das Image wurde erfolgreich auf das BeagleBone Black geflasht!"
else
    echo "FEHLER: Der Flash-Vorgang ist fehlgeschlagen."
    exit 1
fi
