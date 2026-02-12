#!/bin/bash
# Retrieves sudo password from 1Password
# Used by Homebrew casks that require elevated permissions

# Find op binary - check common locations since sudo may have minimal PATH
OP_BIN=""
for path in /opt/homebrew/bin/op /usr/local/bin/op /usr/bin/op "$HOME/.local/bin/op"; do
    if [[ -x "$path" ]]; then
        OP_BIN="$path"
        break
    fi
done

# Fall back to PATH lookup
if [[ -z "$OP_BIN" ]]; then
    OP_BIN=$(command -v op 2>/dev/null)
fi

if [[ -z "$OP_BIN" || ! -x "$OP_BIN" ]]; then
    echo "ERROR: 1Password CLI (op) not found." >&2
    exit 1
fi

"$OP_BIN" read --account "everyone.1password.com" "op://Private/Danny Mac Computer Password/password"
