## Update profile

Change `~/.bash_profile` or `~/.zprofile` according to your default shell.
```sh
# Change shell
FISH_SHELL="/usr/local/bin/fish"
if [ -x "$FISH_SHELL" ]; then
  export SHELL=$FISH_SHELL
  exec $FISH_SHELL
fi
```

## Manual operations

### Homebrew

Install Homebrew from https://brew.sh/ and load formulae.
```sh
cd <dotfiles dir>
brew bundle
```

### Fish shell

Since `setup.sh` puts `~/.config/fish/fish_plugins`, we load plugins based on it.
```sh
curl -sL https://git.io/fisher | source && fisher update
```

About fisher command, refer https://github.com/jorgebucaran/fisher.

### Python packages

They are required by `nvim` and `tmux`.

Execute this interactively (See https://github.com/pyenv/pyenv for details):
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
- https://www.jetbrains.com/lp/mono/
- https://github.com/powerline/fonts (I personally like `Droid Sans Mono for Powerline`)
