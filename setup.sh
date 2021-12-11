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
  .gitconfig
  .gitignore
  .ideavimrc
  .tmux.conf
  .vimrc
  .config/fish/config.fish
  .config/fish/fish_plugins
  .config/karabiner/assets
  .config/karabiner/karabiner.json
  .config/nvim/init.vim
  .config/powerline
)

mkdir -p $HOME/.config/{fish,karabiner,nvim}
mkdir -p $BACKUP_DIR/.config/{fish,karabiner,nvim}

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
  .local/config.fish
)

for file in "${LOCAL_FILES[@]}"
do
  if [ ! -f $HOME/$file ]; then
    cp $DOTFILES/$file $HOME/$file
  fi
done


echo "Setup has been done."
echo "Some manual operations are required. Please see https://github.com/alpaca0984/dotfiles#manual-operations"
echo;
