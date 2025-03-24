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

zi snippet OMZP::fzf
zi snippet OMZP::z
zi snippet OMZP::mise

zi light zsh-users/zsh-autosuggestions
zi light zsh-users/zsh-syntax-highlighting

alias g=git
alias vim=nvim
alias rm="rm -i"

export EDITOR=nvim

# Activate `mise` - https://mise.jdx.dev/getting-started.html#activate-mise
eval "$(mise activate zsh)"

# zsh-z - https://github.com/agkozak/zsh-z
export ZSHZ_TRAILING_SLASH=1

# pnpm
export PNPM_HOME="$HOME/Library/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end

eval "$(starship init zsh)"

# Q post block. Keep at the bottom of this file.
[[ -f "${HOME}/Library/Application Support/amazon-q/shell/zshrc.post.zsh" ]] && builtin source "${HOME}/Library/Application Support/amazon-q/shell/zshrc.post.zsh"
