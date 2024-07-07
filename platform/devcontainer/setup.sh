#!/usr/bin/env bash

# --------------------
# Dotfiles Install Command:
#   $ ./platform/devcontainer/setup.sh
#   See also: https://code.visualstudio.com/docs/devcontainers/containers#_personalizing-with-dotfile-repositories
# --------------------

cd $HOME
DOTFILES=$HOME/dotfiles


# ----- Create links -----

typeset -A FILES=(
  # from -> to
  '.vimrc' '.vimrc'
  '.config/nvim' '.config/nvim'
  '.config/starship.toml' '.config/starship.toml'
  'platform/devcontainer/.zshrc' '.zshrc'
)

for from in "${!FILES[@]}"
do
  to=${FILES[$from]}
  if [[ -L $HOME/$to ]]; then
    continue
  fi

  if [[ -e $HOME/$to ]]; then
    rm -rf $HOME/$to
  fi
  ln -s $DOTFILES/$from $HOME/$to
done


# ----- Install dependencies -----

sudo apt update && sudo apt upgrade -y

if ! command -v python3 &> /dev/null; then
  sudo apt install -y python3
fi

# fzf - https://github.com/junegunn/fzf
sudo apt install -y fzf neovim python3-neovim

# Starship - https://starship.rs/
curl -sS https://starship.rs/install.sh | sh -s -- -y
