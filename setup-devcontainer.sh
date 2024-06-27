#!/usr/bin/env bash

cd $HOME
DOTFILES=$HOME/dotfiles


# ----- Create links with backup -----

FILES=(
  .gitconfig
  .vimrc
  .zprofile
  .zshrc
  .config/nvim
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

for file in "${LOCAL_FILES[@]}"
do
  if [[ ! -f $HOME/$file ]]; then
    cp $DOTFILES/$file $HOME/$file
  fi
done


# ----- Install dependencies -----

# Starship - https://starship.rs/
curl -sS https://starship.rs/install.sh | sh -s -- -y

# fzf - https://github.com/junegunn/fzf
sudo apt install fzf python3-neovim


# ----- Complete -----

source $HOME/.zshrc
vim +PlugInstall +qall

echo "Setup has been done."
echo;
