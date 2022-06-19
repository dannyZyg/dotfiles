#!/bin/bash

VAULT_ID=espanso

if ! command -v espanso &> /dev/null
then
  echo "Espanso is either not installed or not in the PATH"
  exit
fi

ESPANSO_DIR=$(espanso path | awk '{print $2}' | head -n 1)

cp -r $ESPANSO_DIR .

ansible-vault encrypt --vault-id $VAULT_ID@prompt espanso/match/* espanso/config/*
