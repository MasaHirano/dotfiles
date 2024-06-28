#!/usr/bin/env bash

# --------------------
# Dotfiles Install Command:
#   $ ./platform/devcontainer/setup.sh
# --------------------

cd $HOME
DOTFILES=$HOME/dotfiles


# ----- Create links -----

typeset -A FILES=(
  # from -> to
  '.gitconfig' '.gitconfig'
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


# ----- Local settings templates -----

LOCAL_FILES=(
  .local/.gitconfig
  .local/.zshrc
)

mkdir -p $HOME/.local

for file in "${LOCAL_FILES[@]}"
do
  if [[ ! -f $HOME/$file ]]; then
    cp $DOTFILES/$file $HOME/$file
  fi
done


# ----- Install dependencies -----

sudo apt update && sudo apt upgrade

if ! command -v python3 &> /dev/null; then
  sudo apt install -y python3
fi

# fzf - https://github.com/junegunn/fzf
sudo apt install -y neovim fzf python3-neovim

# Starship - https://starship.rs/
curl -sS https://starship.rs/install.sh | sh -s -- -y
