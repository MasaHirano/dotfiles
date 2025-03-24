# dotfiles

Configuration files for Zsh, Vim, and any other useful tools that power my Software Development.

## Setup

The setup script moves your current configuration files to a backup folder. See https://github.com/alpaca0984/dotfiles/blob/main/setup.sh for details.
```sh
git clone https://github.com/masahirano/dotfiles.git
cd dotfiles
sh setup.sh
```

## Manual operations

After executing `setup.sh`, there is some chore that needs to be done manually.

### Install Python packages

Some Python packages are required by Neovim and tmux.

Install Python and packages.
```sh
mise install python@latest
pip install neovim psutil netifaces
```

### Fonts

Install one of the powerline fonts from [nerd-fonts](https://github.com/ryanoasis/nerd-fonts).
- [JetBrainsMono Nerd Font](https://github.com/ryanoasis/nerd-fonts/tree/master/patched-fonts/JetBrainsMono) (my favorite)
