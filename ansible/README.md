
### DZK-BOOTSTRAP

My personal ansible playbook to get a system up and running from nothing. This
is a work in progress...

Currently there is patchy support for both linux and mac.

Run `make` to list all install options.

```
all                  Run the full ansible playbook
debug                Print out env vars
dotfiles             Install dotfiles with dotbot
espanso-pack         Encrypt the system espanso files - overwrites repo files
espanso-unpack       Decrypt espanso repo files into the config path
help                 Show this help
node                 Install Node, N and a version of node with N
node-npm             Install Node, N and npm packages
npm                  Install npm packages
pacman-aur-dump      Saves installed aur packages to txt
pacman-dump          Saves installed pacman packages to txt
pacman-install       Install pacman packages
pipx                 Installs pipx pachages
pull-repos           Pulls my github repos
python               Installs Python with conda
ssh                  Install ssh key
```

Run a specific option using `make all` for example.
