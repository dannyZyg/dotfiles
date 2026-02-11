# Ansible Bootstrap

My personal ansible playbook to get a system up and running from nothing.

Supports MacOS (primary) and Linux (limited support).

## MacOS Setup

### Install Dependencies

Install Homebrew:

    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

Install 1Password and Ansible:

    /opt/homebrew/bin/brew install 1password ansible

### Run the Playbook

Run the full playbook:

    ansible-playbook local.yml --ask-vault-pass --ask-become-pass

## Available Tags

List all available tags:

    ansible-playbook local.yml --list-tags

Run specific tasks using the `-t` flag:

    ansible-playbook local.yml -t <tag>

### Common Tags

| Tag | Description |
|-----|-------------|
| `dotfiles` | Install dotfiles with dotbot |
| `node`, `npm` | Install Node.js and npm packages |
| `python` | Install Python tooling |
| `brew_main` | Install Homebrew formulae and main casks |
| `brew_home` | Install Homebrew home casks |
| `brew_music` | Install Homebrew music casks |
| `espanso` | Decrypt and install espanso config |
| `shell` | Install zsh and shell tools |
| `ssh` | Decrypt SSH config |
| `rust` | Install Rust and cargo packages |
| `repos` | Clone personal git repos |
| `fonts` | Install fonts |

### Commands Requiring Extra Flags

Some tasks require vault password or sudo:

```bash
# Full playbook (requires vault + sudo)
ansible-playbook local.yml --ask-vault-pass --ask-become-pass

# Shell setup (requires vault + sudo)
ansible-playbook local.yml -t shell --ask-vault-pass --ask-become-pass

# SSH config (requires vault)
ansible-playbook local.yml -t ssh --ask-vault-pass

# Espanso config (requires vault)
ansible-playbook local.yml -t espanso --ask-vault-pass
```

### Dry Run

Use `--check` to see what would change without making changes:

    ansible-playbook local.yml -t brew_main --check

## Encrypting Espanso Config

To encrypt the system espanso files back into the repo:

    ./scripts/encrypt-espanso-conf.sh
