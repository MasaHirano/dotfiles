alias vim=nvim

export DOTFILES_ROOT=$HOME/dotfiles

# pyenv
export PYENV_ROOT="$HOME/.pyenv"
command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"

# this must be done after pip is initialized because it uses `pip` command
export POWERLINE_REPOSITORY_ROOT="$(pip show powerline-status | grep Location | cut -d ' ' -f 2)"

# zsh-z - https://github.com/agkozak/zsh-z
export ZSHZ_TRAILING_SLASH=1
