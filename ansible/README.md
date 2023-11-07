# Ansible Bootstrap

My personal ansible playbook to get a system up and running from nothing. This
is a work in progress...

There is (in progress) support for MacOS and Linux (arch and debian based systems)

## Dependencies

You will need to have `ansible` installed before running any of the playbooks.

### MacOS
- Install brew
    - `/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"`
- Install 1Password
    - `/opt/homebrew/bin/brew install 1password`
- Install ansible
    - `/opt/homebrew/bin/brew install ansible`

### Linux
- ansible
    - `sudo pacman -S ansible` on arch
    - `sudo apt install ansible` on debian family systems

# Tasks

Run `make` to list all install options.

The `all` command is still experimental as I debug running the whole playbook without errors...

```
all                  Run the full ansible playbook
apple                Setup Apple system settings
apt-install          Install pacman packages
build-packages       Build packages from src
cargo                Install cargo packages
debug                Print out env vars
dotfiles             Install dotfiles with dotbot
espanso-pack         Encrypt the system espanso files - overwrites repo files
espanso-unpack       Decrypt espanso repo files into the config path
facts                Gather ansible facts
flatpak-install      Installs flatpak packages
help                 Show this help
install-packages     Install all packages
node-npm             Install Node, N and npm packages
node                 Install Node, N and a version of node with N
npm                  Install npm packages
nvim                 Clone, build and install neovim
pacman-aur-install   Install aur packages
pacman-install       Install pacman packages
pipx                 Installs pipx pachages
pull-repos           Pulls my github repos
python               Installs Python with conda
rust                 Installs rust and global cargo packages
shell                Installs zsh and related tools, sets the default shell
system-files         Installs any system files
```

Run a specific option using `make all` for example.

