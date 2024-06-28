# Zinit - https://github.com/zdharma-continuum/zinit?tab=readme-ov-file#manual
ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"
[ ! -d $ZINIT_HOME ] && mkdir -p "$(dirname $ZINIT_HOME)"
[ ! -d $ZINIT_HOME/.git ] && git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
source "${ZINIT_HOME}/zinit.zsh"

zi snippet OMZL::directories.zsh
zi snippet OMZL::key-bindings.zsh
# See:
# - https://github.com/zdharma-continuum/zinit?tab=readme-ov-file#calling-compinit-with-turbo-mode
# - https://zdharma-continuum.github.io/zinit/wiki/For-Syntax/#examples
zi wait lucid atload"zicompinit" for \
  OMZL::completion.zsh

zi snippet OMZP::fzf
zi snippet OMZP::z
zi snippet OMZP::asdf

zi light zsh-users/zsh-autosuggestions
zi light zsh-users/zsh-syntax-highlighting

alias g=git
alias vim=nvim
alias rm="rm -i"

# zsh-z - https://github.com/agkozak/zsh-z
export ZSHZ_TRAILING_SLASH=1

# load local configuration file if exists
[[ -f $HOME/.local/.zshrc ]] && source $HOME/.local/.zshrc

eval "$(starship init zsh)"

[[ ! -d "$HOME/.vim/plugged/" ]] && vim +PlugInstall +qall
