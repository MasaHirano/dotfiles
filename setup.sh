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
  .asdfrc
  .config/karabiner/assets
  .config/mise/config.toml
  .config/nvim
  .config/starship.toml
  .gitconfig
  .ideavimrc
  .vimrc
  .zprofile
  .zshrc
  Brewfile
)

for file in "${FILES[@]}"; do
  if [[ -L $HOME/$file ]]; then
    continue
  fi

  mkdir -p "$(dirname "$HOME/$file")"
  mkdir -p "$(dirname "$BACKUP_DIR/$file")"
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

for file in "${LOCAL_FILES[@]}"; do
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
mise install
pip install neovim

# Set up Neovim with lazy.nvim
if [[ -d $HOME/.local/share/nvim/lazy ]]; then
  echo "lazy.nvim is already installed."
else
  echo "Setting up Neovim with lazy.nvim..."
  # Create necessary directories
  mkdir -p $HOME/.local/share/nvim

  # First run of Neovim will install lazy.nvim and plugins
  NVIM_APPNAME=nvim nvim --headless "+Lazy! sync" +qa
fi

echo "Setup has been done."
echo "Some manual operations are required. Please see https://github.com/masahirano/dotfiles#manual-operations"
echo;
