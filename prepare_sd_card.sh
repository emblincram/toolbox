#!/bin/bash

# SPDX-License-Identifier: MIT
# SPDX-Author: Roman Koch <koch.romam@gmail.com>
# SPDX-Copyright: 2024 Roman Koch <koch.romam@gmail.com>

# Konfiguration
IMAGES_DIR="build/deploy-ti/images/beagle-x15" # Pfad zu den Yocto-Images
OUTPUT_DIR="build/sd-card" # Zielordner für entpackte Dateien

# Prüfen, ob der Quellordner existiert
if [ ! -d "$IMAGES_DIR" ]; then
  echo "FEHLER: Der Quellordner $IMAGES_DIR existiert nicht."
  exit 1
fi

if [ -d "$OUTPUT_DIR" ]; then
  echo "$OUTPUT_DIR directory exists: remove"
  rm -rf "$OUTPUT_DIR"
fi

# Zielordner erstellen
echo "Erstelle Zielordner: $OUTPUT_DIR"
mkdir -p "$OUTPUT_DIR"

# Dateien kopieren
echo "Kopiere .wic.xz und .bmap Dateien..."
#cp "$IMAGES_DIR"/*.wic.xz "$OUTPUT_DIR" 2>/dev/null
#cp "$IMAGES_DIR"/*.bmap "$OUTPUT_DIR" 2>/dev/null
find "$IMAGES_DIR" -type f -name "*.wic.xz" -exec cp -P {} "$OUTPUT_DIR" \;
find "$IMAGES_DIR" -type f -name "*.bmap" -exec cp -P {} "$OUTPUT_DIR" \;

# Dateien entpacken
echo "Entpacke .wic.xz Dateien..."
for file in "$OUTPUT_DIR"/*.wic.xz; do
  if [ -f "$file" ]; then
    echo "Entpacke $file..."
    xz -d "$file"
  else
    echo "Keine .wic.xz Dateien gefunden."
  fi
done

# Statusmeldung
echo "Fertig! Die entpackten Dateien befinden sich in $OUTPUT_DIR."
