#!/bin/bash
# Retrieves the Ansible vault password from 1Password
# Requires: 1Password CLI installed and configured with app integration

if ! command -v op &> /dev/null; then
    echo "ERROR: 1Password CLI (op) not found." >&2
    echo "See ansible/README.md for setup instructions." >&2
    exit 1
fi

op read "op://Private/lhz6hvtgx5szolw62tk4zmhdia/password"
