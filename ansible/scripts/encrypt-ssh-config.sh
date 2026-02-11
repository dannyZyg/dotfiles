#!/bin/bash

VAULT_ID=ssh-config

cp ~/.ssh/config ./roles/ssh/files/config

ansible-vault encrypt \
  --encrypt-vault-id $VAULT_ID \
  --vault-id $VAULT_ID@scripts/vault-password.sh \
  ./roles/ssh/files/config
