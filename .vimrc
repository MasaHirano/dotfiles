source $DOTFILES_ROOT/vimrcs/basic.vim

source $DOTFILES_ROOT/vimrcs/plugins.vim

source $DOTFILES_ROOT/vimrcs/plugins_config.vim

" This must be put below plugins.vim because color schemes are installed as plugins
source $DOTFILES_ROOT/vimrcs/color.vim

if filereadable($HOME . "/.local/.vimrc")
  source ~/.local/.vimrc
endif
