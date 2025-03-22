#!/bin/bash

cd $HOME
DOTFILES=$HOME/dotfiles


# ----- Create backup directory. -----

DATE=`date +%Y%m%d_%H%M%S`
BACKUP_DIR=$HOME/backup_home/$DATE
mkdir -p $BACKUP_DIR
echo "Created a directory: $BACKUP_DIR"
echo;


# ----- Create links with backup -----

FILES=(
  Brewfile
  .asdfrc
  .config/karabiner/assets
  .config/nvim
  .config/powerline
  .config/starship.toml
  .gitconfig
  .ideavimrc
  .tmux.conf
  .vimrc
  .zprofile
  .zshrc
)

mkdir -p $HOME/.config/{nvim,karabiner}
mkdir -p $BACKUP_DIR/.config/{nvim,karabiner}

for file in "${FILES[@]}"
do
  if [[ -L $HOME/$file ]]; then
    continue
  fi

  if [[ -e $HOME/$file ]]; then
    cp -pr $HOME/$file $BACKUP_DIR/$file
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

# Homebrew - https://docs.brew.sh/Installation
if ! type brew > /dev/null; then
  curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh
fi

PATH=$(brew --prefix)/bin:$PATH
brew bundle

echo "Setup has been done."
echo "Some manual operations are required. Please see https://github.com/masahirano/dotfiles#manual-operations"
echo;
