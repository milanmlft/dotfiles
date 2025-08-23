#!/bin/bash

set -euxo pipefail

OBSIDIAN_DIR=~/obsidian
VAULT_DIR=home
DATE=$(date +%Y-%m-%d)

ICLOUD_DIR=${OBSIDIAN_DIR}/obsidian-icloud
ZIP_FILE=${ICLOUD_DIR}/${DATE}_${VAULT_DIR}.zip

cd "$OBSIDIAN_DIR"
echo "Zipping $VAULT_DIR to $ZIP_FILE"
zip -r ${ZIP_FILE} ${VAULT_DIR}/* -x ${VAULT_DIR}/.git/
