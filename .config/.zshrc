eval "$(pyenv init --path)"

export POWERLINE_REPOSITORY_ROOT="$(pip show powerline-status | grep Location | cut -d ' ' -f 2)"

alias vim=nvim

# zsh-z - https://github.com/agkozak/zsh-z
export ZSHZ_TRAILING_SLASH=1
