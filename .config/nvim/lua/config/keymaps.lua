-- Keymaps configuration
local map = vim.keymap.set

-- Leader key
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-----------------------------------------------------------
-- Editing mappings
-----------------------------------------------------------
-- Use mappings that are used by default in readline
-- @see https://www.gnu.org/software/emacs/refcards/pdf/refcard.pdf
map("i", "<C-a>", "<Home>", { silent = true, desc = "Go to beginning of line" })
map("i", "<C-b>", "<Left>", { silent = true, desc = "Move cursor left" })
map("i", "<C-d>", "<Del>", { silent = true, desc = "Delete character under cursor" })
map("i", "<C-e>", "<End>", { silent = true, desc = "Go to end of line" })
map("i", "<C-f>", "<Right>", { silent = true, desc = "Move cursor right" })
map("i", "<C-k>", "<C-o>D<Right>", { silent = true, desc = "Delete to end of line" })
map("i", "<C-n>", "<Down>", { silent = true, desc = "Move cursor down" })
map("i", "<C-p>", "<Up>", { silent = true, desc = "Move cursor up" })
