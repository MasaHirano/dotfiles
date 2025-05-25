# Q pre block. Keep at the top of this file.
[[ -f "${HOME}/Library/Application Support/amazon-q/shell/zshrc.pre.zsh" ]] && builtin source "${HOME}/Library/Application Support/amazon-q/shell/zshrc.pre.zsh"

# load local configuration file if exists
[[ -f $HOME/.local/.zshrc ]] && source $HOME/.local/.zshrc

# Zinit - https://github.com/zdharma-continuum/zinit?tab=readme-ov-file#manual
ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"
[ ! -d $ZINIT_HOME ] && mkdir -p "$(dirname $ZINIT_HOME)"
[ ! -d $ZINIT_HOME/.git ] && git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
source "${ZINIT_HOME}/zinit.zsh"

mkdir -p $ZSH_CACHE_DIR/completions

zi snippet OMZL::directories.zsh
zi snippet OMZL::key-bindings.zsh
# See:
# - https://github.com/zdharma-continuum/zinit?tab=readme-ov-file#calling-compinit-with-turbo-mode
# - https://zdharma-continuum.github.io/zinit/wiki/For-Syntax/#examples
zi wait lucid atload"zicompinit" for \
  OMZL::completion.zsh

# The mise plugin must be loaded first since other plugins depend on it.
zi snippet OMZP::mise
zi snippet OMZP::direnv
zi snippet OMZP::fzf
zi snippet OMZP::starship
zi snippet OMZP::z

zi light zsh-users/zsh-syntax-highlighting
if [[ ! -f "${HOME}/Library/Application Support/amazon-q/shell/zshrc.pre.zsh" ]]; then
  zi light zsh-users/zsh-autosuggestions
fi

alias g=git
alias vim=nvim
alias rm="rm -i"

export EDITOR=nvim
export ZSHZ_TRAILING_SLASH=1 # zsh-z - https://github.com/agkozak/zsh-z

# Q post block. Keep at the bottom of this file.
[[ -f "${HOME}/Library/Application Support/amazon-q/shell/zshrc.post.zsh" ]] && builtin source "${HOME}/Library/Application Support/amazon-q/shell/zshrc.post.zsh"
