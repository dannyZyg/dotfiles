# Ansible Bootstrap

Personal ansible playbook to bootstrap a Mac from scratch.

Supports MacOS (primary) and Linux (limited support).

## Quick Start (New Mac)

### Phase 1: Pre-requisites

**1. Install Homebrew:**

```bash
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

**2. Install 1Password, 1Password CLI, and Ansible:**

```bash
/opt/homebrew/bin/brew install --cask 1password
/opt/homebrew/bin/brew install 1password-cli ansible
```

**3. Configure 1Password:**

- Open 1Password app and sign in to your account
- Enable CLI integration: **Settings > Developer > "Integrate with 1Password CLI"**
- Ensure your ansible vault password is stored in 1Password
- Verify CLI works:

```bash
op vault list
```

This should output your vault list (you may be prompted for Touch ID).

### Phase 2: Bootstrap

Clone this repo and run the bootstrap:

```bash
git clone https://github.com/yourusername/.dotfiles.git ~/.dotfiles
cd ~/.dotfiles/ansible
ansible-playbook local.yml -t bootstrap --ask-become-pass
```

This installs the core setup:
- Dotfiles (via dotbot)
- Homebrew formulae and main casks
- Node.js and npm packages
- Python tooling (pyenv, poetry, uv)
- Espanso text expansion
- Starship prompt
- Shell configuration (zsh)
- SSH config

### Phase 3: Additional Setup

Run optional tags as needed:

```bash
# Music production apps (Ableton, audio plugins, etc.)
ansible-playbook local.yml -t brew_music --ask-become-pass

# Home machine apps
ansible-playbook local.yml -t brew_home --ask-become-pass

# Clone personal git repos
ansible-playbook local.yml -t repos

# Install fonts
ansible-playbook local.yml -t fonts

# Install Rust
ansible-playbook local.yml -t rust
```

## Available Tags

| Tag | Description | Sudo Required |
|-----|-------------|---------------|
| `bootstrap` | Full core setup (dotfiles, brew, languages, shell) | Yes |
| `dotfiles` | Install dotfiles with dotbot | No |
| `node`, `npm` | Install Node.js and npm packages | No |
| `python` | Install Python tooling (pyenv, poetry, uv) | No |
| `brew_main` | Install Homebrew formulae and main casks | No |
| `brew_home` | Install Homebrew home casks | No |
| `brew_music` | Install Homebrew music casks | No |
| `espanso` | Install espanso config | No |
| `shell` | Install zsh and shell tools | Yes |
| `starship` | Install starship prompt | Yes |
| `ssh` | Install SSH config | No |
| `fonts` | Install fonts | No |
| `repos` | Clone personal git repos | No |
| `rust` | Install Rust and cargo packages | No |

## Useful Commands

**List all available tags:**

```bash
ansible-playbook local.yml --list-tags
```

**Dry run (see what would change):**

```bash
ansible-playbook local.yml -t bootstrap --check
```

**Run full playbook (everything):**

```bash
ansible-playbook local.yml --ask-become-pass
```

## Vault Password

The vault password is automatically retrieved from 1Password via the CLI.
This is configured in `ansible.cfg` using the `vault_identity_list` setting.

Encrypted files:
- `roles/ssh/files/config` (vault-id: ssh-config)
- `roles/espanso/files/match/*.yml` (vault-id: espanso)

### Encrypting Files

To encrypt the espanso config files:

```bash
./scripts/encrypt-espanso-conf.sh
```

To encrypt the SSH config:

```bash
./scripts/encrypt-ssh-config.sh
```

## Troubleshooting

**"ERROR: 1Password CLI (op) not found":**

You'll see this if you try to run ansible before completing Phase 1. Install and configure
1Password CLI first:

```bash
brew install --cask 1password
brew install 1password-cli
# Then open 1Password app > Settings > Developer > "Integrate with 1Password CLI"
```

**1Password CLI not working:**

```bash
# Check if CLI is installed
op --version

# Check if app integration is enabled (should prompt for Touch ID)
op vault list
```

**Vault password errors:**

```bash
# Test vault password retrieval
./scripts/vault-password.sh

# If this fails, verify the 1Password item exists and path is correct
op read "op://Private/lhz6hvtgx5szolw62tk4zmhdia/password"
```
