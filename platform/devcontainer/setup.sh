#!/bin/sh

# --------------------
# Dotfiles Install Command:
#   $ ./platform/devcontainer/setup.sh
#   See also: https://code.visualstudio.com/docs/devcontainers/containers#_personalizing-with-dotfile-repositories
# --------------------

set -e

cd "$HOME"
DOTFILES="$HOME/dotfiles"

# ----- Create links -----

# List of source and destination pairs
FILES="
.config/nvim .config/nvim
.config/starship.toml .config/starship.toml
.vimrc .vimrc
.zshrc .zshrc
platform/devcontainer/.local/.zshrc .local/.zshrc
"

echo "$FILES" | while read from to; do
  # Skip if from or to is empty
  [ -z "$from" ] || [ -z "$to" ] && continue

  target="$HOME/$to"

  if [ -L "$target" ]; then
    continue
  fi

  if [ -d "$target" ]; then
    echo "Error: $target exists and is a directory. Skipping." >&2
    continue
  fi

  if [ -e "$target" ]; then
    rm -f "$target"
  fi

  mkdir -p "$(dirname "$target")"
  ln -s "$DOTFILES/$from" "$target"
done

# ----- Install dependencies -----

# Detect package manager
if command -v apt >/dev/null 2>&1; then
  sudo apt update && sudo apt upgrade -y && sudo apt install -y zsh curl fzf neovim python3-neovim
elif command -v apk >/dev/null 2>&1; then
  apk update && apk upgrade && apk add zsh curl fzf neovim py3-pynvim sudo shadow
else
  echo "Unsupported package manager. Only apt and apk are supported."
  exit 1
fi

# Install mise - https://github.com/jdx/mise
if ! command -v mise >/dev/null 2>&1; then
  curl https://mise.run | sh
fi

# Install Starship - https://starship.rs/
if ! command -v starship >/dev/null 2>&1; then
  curl -sS https://starship.rs/install.sh | sh -s -- -y
fi

sudo chsh -s /bin/zsh

# vim-plug
DOTFILES_ROOT="$DOTFILES" nvim +PlugInstall +qall
