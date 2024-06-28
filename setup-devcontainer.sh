#!/usr/bin/env bash

# --------------------
# Dotfiles Install Command:
#   ./setup-devcontainer.sh && source $HOME/.zshrc && vim +PlugInstall +qall
# --------------------

cd $HOME
DOTFILES=$HOME/dotfiles


# ----- Create links with backup -----

FILES=(
  .gitconfig
  .vimrc
  .zshrc
  .config/starship.toml
)

for file in "${FILES[@]}"
do
  if [[ -L $HOME/$file ]]; then
    continue
  fi

  if [[ -e $HOME/$file ]]; then
    rm -rf $HOME/$file
  fi
  ln -s $DOTFILES/$file $HOME/$file
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
