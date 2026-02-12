#!/bin/bash
# Retrieves the Ansible vault password from 1Password
# Requires: 1Password CLI installed and configured with app integration

if ! command -v op &> /dev/null; then
    echo "ERROR: 1Password CLI (op) not found." >&2
    echo "See ansible/README.md for setup instructions." >&2
    exit 1
fi

# Parse --vault-id argument
VAULT_ID=""
while [[ $# -gt 0 ]]; do
    case "$1" in
        --vault-id)
            VAULT_ID="$2"
            shift 2
            ;;
        *)
            shift
            ;;
    esac
done

case "$VAULT_ID" in
    ssh-config)
        op read --account "everyone.1password.com" "op://Private/Ansible Vault Encryption SSH Config/password"
        ;;
    espanso)
        op read --account "everyone.1password.com" "op://Private/Ansible Vault Encryption Espanso/password"
        ;;
    *)
        echo "ERROR: Unknown vault-id: $VAULT_ID" >&2
        exit 1
        ;;
esac
