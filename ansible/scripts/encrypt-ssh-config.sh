#!/bin/bash

VAULT_ID=ssh-config

cp ~/.ssh/config ./ssh/config

ansible-vault encrypt --vault-id $VAULT_ID@prompt ./ssh/config
