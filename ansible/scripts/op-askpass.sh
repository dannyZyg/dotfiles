#!/bin/bash
# Retrieves macOS sudo password from 1Password
# Used by Homebrew casks that require elevated permissions

if ! command -v op &> /dev/null; then
    echo "ERROR: 1Password CLI (op) not found." >&2
    exit 1
fi

op read "op://Private/Danny Mac Computer Password/password"
