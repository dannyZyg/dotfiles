# DK's dotfiles

Configuration featuring `zsh`, `neovim`, `tmux`, `alacritty` and various
linux/unix configs all handled by `dotbot`.

Full system bootstrap handled by `ansible` in `./ansible`

Supports MacOS and Linux

## Installation

### Dotfiles

You can install the dotfiles on their own from this directory

- Run `make` to see all options.

```
dotbot-run           Runs the dotbot install script
git-submodule-update Updates git submodules
help                 Show this help
```

### Bootstrap

Otherwise, you can bootstrap an entire system (which can also handle the dotfiles).

See `./ansible/README.md`
