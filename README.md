# dotfiles

Configuration files for Zsh, Neovim, Vim, and any other useful tools that power my Software Development.

## Features

- **Zsh configuration** with plugins managed by [zinit](https://github.com/zdharma-continuum/zinit)
- **Neovim configuration** using Lua and [lazy.nvim](https://github.com/folke/lazy.nvim) for plugin management
- **Vim configuration** (legacy) using vim-plug
- **Terminal settings** with Starship prompt
- **Git configuration** for daily development

## Setup

The setup script moves your current configuration files to a backup folder. See https://github.com/alpaca0984/dotfiles/blob/main/setup.sh for details.
```sh
git clone https://github.com/masahirano/dotfiles.git
cd dotfiles
sh setup.sh
```

## Manual operations

After executing `setup.sh`, there is some chore that needs to be done manually.

### Fonts

Install one of the powerline fonts from [nerd-fonts](https://github.com/ryanoasis/nerd-fonts).
- [JetBrainsMono Nerd Font](https://github.com/ryanoasis/nerd-fonts/tree/master/patched-fonts/JetBrainsMono) (my favorite)

### Neovim Setup

The dotfiles now include a modern Neovim configuration using Lua and lazy.nvim. This configuration follows the recommended structured approach from lazy.nvim and will be installed automatically when you run the setup script.

If you're migrating from the previous vimscript-based configuration, check out these resources:
```sh
# Migration guide
~/.config/nvim/MIGRATION.md

# Structure documentation
~/.config/nvim/STRUCTURE.md
```

To help with migration of any custom settings, run:
```sh
~/.config/nvim/migration_helper.sh
```
