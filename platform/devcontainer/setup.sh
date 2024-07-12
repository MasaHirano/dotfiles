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
  'platform/devcontainer/.zshrc' '.zshrc'
  'platform/devcontainer/.config/starship.toml' '.config/starship.toml'
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

# zsh plugins
ZSH_PLUGINS="$HOME/.oh-my-zsh/custom/plugins"
if [[ ! -d "${ZSH_PLUGINS}/zsh-autosuggestions" ]]; then
  git clone --depth 1 https://github.com/zsh-users/zsh-autosuggestions \
    "${ZSH_PLUGINS}/zsh-autosuggestions"
fi
if [[ ! -d "${ZSH_PLUGINS}/zsh-syntax-highlighting" ]]; then
  git clone --depth 1 https://github.com/zsh-users/zsh-syntax-highlighting.git \
    "${ZSH_PLUGINS}/zsh-syntax-highlighting"
fi
