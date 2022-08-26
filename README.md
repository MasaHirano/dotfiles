# dotfiles

Configuration files for Fish-shell, Vim, tmux, and any other useful tools that power my Software Development.

## Setup

The setup script moves your current configuration files to a backup folder. See https://github.com/alpaca0984/dotfiles/blob/main/setup.sh for details.
```sh
git clone https://github.com/alpaca0984/dotfiles.git
cd dotfiles
sh setup.sh
```

## Manual operations

After executing `setup.sh`, there is some chore that needs to be done manually.

### Setup zsh

- Install oh-my-zsh following https://ohmyz.sh/#install
- Add this code block to the top of ~/.zshrc (before sourcing oh-my-zsh)
```sh
if [[ -f "$HOME/.config/.zshrc" ]]; then
  source $HOME/.config/.zshrc
fi

if [[ -f "$HOME/.local/.zshrc" ]]; then
  source $HOME/.local/.zshrc
fi
```

### Install Homebrew formulae

Install Homebrew from https://brew.sh/ and load formulae.
```sh
cd <dotfiles-dir>
brew bundle
```

### Fish shell

Besides `zsh`, Fish-Shell is used for integrated terminals in VSCode and JetBrains IDEs.

Install `fisher` and load plugins based on ~/.config/fish/fish_plugins (see https://github.com/jorgebucaran/fisher for details).
```sh
curl -sL https://git.io/fisher | source && fisher update
```

### Python packages

Some Python packages are required by Neovim and tmux.

Execute this interactively (see https://github.com/pyenv/pyenv for details):
```sh
set -Ux PYENV_ROOT $HOME/.pyenv
set -U fish_user_paths $PYENV_ROOT/bin $fish_user_paths
```

Install Python and packages.
```sh
pyenv install <python-version>
pyenv rehash
pyenv global <python-version>
pip install neovim powerline-status psutil netifaces
```

### Fonts

Install powerline fonts from either of them:
- [JetBrains Mono](https://www.jetbrains.com/lp/mono/) (I personally like this)
- [Powerline fonts](https://github.com/powerline/fonts)
