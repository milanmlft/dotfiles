#!/bin/bash

set -euxo pipefail

OBSIDIAN_DIR=~/obsidian
VAULT_DIR=home
DATE=$(date +%Y-%m-%d)
ZIP_FILE=${DATE}_${VAULT_DIR}.zip

cd "$OBSIDIAN_DIR"
echo "Zipping $VAULT_DIR to $ZIP_FILE"
zip -r "$ZIP_FILE" "$VAULT_DIR"
