if empty($DOTFILES_ROOT)
  echoerr "Error: DOTFILES_ROOT is empty"
endif

" vim-plug: automatic installation
"   https://github.com/junegunn/vim-plug/wiki/tips#automatic-installation
let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

let s:files = [
  \ $DOTFILES_ROOT . "/vimrcs/basic.vim",
  \ $DOTFILES_ROOT . "/vimrcs/plugins.vim",
  \ $DOTFILES_ROOT . "/vimrcs/plugins_config.vim",
  \ $DOTFILES_ROOT . "/vimrcs/color.vim",
  \ "~/.local/.vimrc",
\ ]

for file in s:files
  if filereadable(expand(file))
    execute 'source ' . file
  endif
endfor
