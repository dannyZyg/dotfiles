#!/bin/bash

VAULT_ID=espanso

if ! command -v espanso &> /dev/null
then
  echo "Espanso is either not installed or not in the PATH"
  exit
fi

ESPANSO_DIR=$(espanso path | head -n 1 | sed -n 's/Config: \(.*\)/\1/p')

cp -rf "$ESPANSO_DIR/"* roles/espanso/files/

ansible-vault encrypt \
  --encrypt-vault-id $VAULT_ID \
  --vault-id $VAULT_ID@scripts/vault-password.sh \
  roles/espanso/files/match/*.yml \
  roles/espanso/files/config/*.yml
