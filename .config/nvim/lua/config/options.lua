-- Basic Neovim settings (migrated from basic.vim)

local opt = vim.opt
local g = vim.g

-- => General
-- Set to auto read when a file is changed from the outside
opt.autoread = true
vim.cmd [[
  au FocusGained,BufEnter * checktime
]]

-- => VIM user interface
-- Turn on the Wild menu
opt.wildmenu = true
opt.wildmode = "list:full"

-- A buffer becomes hidden when it is abandoned
opt.hidden = true

-- Configure backspace
opt.backspace = "eol,start,indent"
opt.whichwrap:append("<,>,h,l")

-- Search settings
opt.ignorecase = true
opt.smartcase = true
opt.hlsearch = true
opt.incsearch = true

-- Show matching brackets
opt.showmatch = true

-- Hide command in the last line of the screen
opt.showcmd = false

-- Show mode
opt.showmode = true

-- Line numbers
opt.number = true

-- Show invisible characters
opt.list = true
opt.listchars = { tab = "> " }

-- Window title
opt.title = false

-- Scrolling
opt.scrolloff = 5

-- Show unprintable characters
opt.display = "uhex"

-- No annoying sound on errors
opt.errorbells = false
opt.visualbell = false
vim.cmd [[
  set t_vb=
  set tm=500
]]

-- => Colors and Fonts
-- Enable syntax highlighting
vim.cmd [[syntax enable]]

-- Set utf8 as standard encoding
opt.encoding = "utf8"

-- Support Japanese
opt.fileencodings = "utf-8,cp932,euc-jp,iso-2022-jp"

-- => Files, backups and undo
-- Turn backup off
opt.backup = false
opt.writebackup = false
opt.swapfile = false

-- => Text, tab and indent related
-- Use spaces instead of tabs
opt.expandtab = true

-- 1 tab == 2 spaces
opt.shiftwidth = 2
opt.tabstop = 2
