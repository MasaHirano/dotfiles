-- Keymaps configuration
local map = vim.keymap.set

-- Leader key
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-----------------------------------------------------------
-- Moving around, tabs and buffers
-----------------------------------------------------------
-- Smart way to move between windows
map("n", "<C-j>", "<C-W>j", { desc = "Move to window below" })
map("n", "<C-k>", "<C-W>k", { desc = "Move to window above" })
map("n", "<C-h>", "<C-W>h", { desc = "Move to left window" })
map("n", "<C-l>", "<C-W>l", { desc = "Move to right window" })

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

-- Map auto complete of (, ", ', [
map("i", "$1", "()<Esc>i", { desc = "Auto complete ()" })
map("i", "$2", "[]<Esc>i", { desc = "Auto complete []" })
map("i", "$3", "{}<Esc>i", { desc = "Auto complete {}" })
map("i", "$4", "{<Esc>o}<Esc>O", { desc = "Auto complete {} with newline" })
map("i", "$q", "''<Esc>i", { desc = "Auto complete ''" })
map("i", "$e", "\"\"<Esc>i", { desc = "Auto complete \"\"" })
