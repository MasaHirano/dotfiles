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
  .gitconfig
  .ideavimrc
  .tmux.conf
  .vimrc
  .zprofile
  .zshrc
  .asdfrc
  .config/fish/config.fish
  .config/fish/fish_plugins
  .config/nvim
  .config/powerline
  .config/karabiner/assets
  .config/starship.toml
)

mkdir -p $HOME/.config/{fish,nvim,karabiner}
mkdir -p $BACKUP_DIR/.config/{fish,nvim,karabiner}

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
  .local/fish/config.fish
)

mkdir -p $HOME/.local/fish

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

# Poetry - https://python-poetry.org/docs/#installing-with-the-official-installer
if ! type poetry > /dev/null; then
  curl -sSL https://install.python-poetry.org | python3 -
fi

# Fisher - https://github.com/jorgebucaran/fisher?tab=readme-ov-file#installation
if ! fish -c "type fisher > /dev/null"; then
  fish -c "curl -sL https://raw.githubusercontent.com/jorgebucaran/fisher/main/functions/fisher.fish | source && fisher update"
fi

echo "Setup has been done."
echo "Some manual operations are required. Please see https://github.com/alpaca0984/dotfiles#manual-operations"
echo;
