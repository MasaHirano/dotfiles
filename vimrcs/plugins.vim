" Automatic installation
if empty(glob('~/.local/share/nvim/site/autoload/plug.vim'))
  silent !curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" Specify a directory for plugins
" - For Neovim: ~/.local/share/nvim/plugged
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin()

" A simple Vim plugin to switch segments of text with predefined replacements
"   https://github.com/AndrewRadev/switch.vim
Plug 'AndrewRadev/switch.vim'

" Dark powered asynchronous completion framework for neovim/Vim8
"   https://github.com/Shougo/deoplete.nvim
if has('nvim')
  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
else
  Plug 'Shougo/deoplete.nvim'
  Plug 'roxma/nvim-yarp'
  Plug 'roxma/vim-hug-neovim-rpc'
endif

" Unite and create user interfaces
"   https://github.com/Shougo/unite.vim
Plug 'Shougo/unite.vim'

" Interactive command execution in Vim
"   https://github.com/Shougo/vimproc.vim
Plug 'Shougo/vimproc.vim', {'do' : 'make'}

" A Vim plugin which shows a git diff in the gutter (sign column) and stages/undoes hunks.
"   https://github.com/airblade/vim-gitgutter
Plug 'airblade/vim-gitgutter'

" a unite.vim plugin for rails
"   https://github.com/basyura/unite-rails
Plug 'basyura/unite-rails'

" Add additional support for Ansible in VIM
"   https://github.com/chase/vim-ansible-yaml
Plug 'chase/vim-ansible-yaml'

" Vim script for text filtering and alignment
"   https://github.com/godlygeek/tabular
Plug 'godlygeek/tabular'

" vim-snipmate default snippets
"   https://github.com/honza/vim-snippets
Plug 'honza/vim-snippets'

" Create your own submodes
"   https://github.com/thinca/vim-submode
Plug 'kana/vim-submode'

" emmet for vim
"   https://github.com/mattn/emmet-vim
Plug 'mattn/emmet-vim'

" A Vim plugin for visually displaying indent levels in code
"   https://github.com/nathanaelkane/vim-indent-guides
Plug 'nathanaelkane/vim-indent-guides'

" Better whitespace highlighting for Vim
"   https://github.com/ntpeters/vim-better-whitespace
Plug 'ntpeters/vim-better-whitespace'

" HTML5 omnicomplete and syntax
"   https://github.com/othree/html5.vim
Plug 'othree/html5.vim'

" Vim plugin for intensely orgasmic commenting
"   https://github.com/scrooloose/nerdcommenter
Plug 'scrooloose/nerdcommenter'

" A tree explorer plugin for vim.
"   https://github.com/scrooloose/nerdtree
Plug 'scrooloose/nerdtree'

" A filetype plugin for VIM to help edit XML files
"   https://github.com/sukima/xmledit
Plug 'sukima/xmledit'

" Run commands quickly.
"   https://github.com/thinca/vim-quickrun
Plug 'thinca/vim-quickrun'

" Integrated reference viewer.
"   https://github.com/thinca/vim-ref
Plug 'thinca/vim-ref'

" Molokai color scheme for Vim
"   https://github.com/tomasr/molokai
Plug 'tomasr/molokai'

" endwise.vim: wisely add \"end\" in ruby, endfunction/endif/more in vim script, etc
"   https://github.com/tpope/vim-endwise
Plug 'tpope/vim-endwise'

" Kotlin plugin for Vim. Featuring: syntax highlighting, basic indentation, Syntastic support
"   https://github.com/udalov/kotlin-vim
Plug 'udalov/kotlin-vim'

" lean & mean status/tabline for vim that's light as air
"   https://github.com/vim-airline/vim-airline
Plug 'vim-airline/vim-airline'

" Vim/Ruby Configuration Files
"   https://github.com/vim-ruby/vim-ruby
Plug 'vim-ruby/vim-ruby'

" Help folks to align text, eqns, declarations, tables, etc
"   https://github.com/vim-scripts/Align
Plug 'vim-scripts/Align'

" Delete/change/add parentheses/quotes/XML-tags/much more with ease
"   https://github.com/vim-scripts/surround.vim
Plug 'vim-scripts/surround.vim'

" A vim-ref and Unite.vim source for ri.
"   https://github.com/yuku-t/vim-ref-ri
Plug 'yuku-t/vim-ref-ri'

" DirDiff plugin for Vim
"   https://github.com/will133/vim-dirdiff
Plug 'will133/vim-dirdiff'

" Initialize plugin system
call plug#end()
