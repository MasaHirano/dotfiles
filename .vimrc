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
