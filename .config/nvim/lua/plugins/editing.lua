-- Editing plugins
return {
  -- Switch
  {
    "AndrewRadev/switch.vim",
    keys = { { "<leader>s", "<cmd>Switch<cr>", desc = "Switch" } },
  },

  -- Tabular
  {
    "godlygeek/tabular",
    cmd = "Tabularize",
    keys = { { "<leader>a=", "<cmd>Tabularize /=<cr>", desc = "Align by =" } },
  },

  -- Better comments
  {
    "scrooloose/nerdcommenter",
    keys = {
      { ",,", "<plug>NERDCommenterToggle", mode = "n", desc = "Toggle comment" },
      { ",,", "<plug>NERDCommenterToggle", mode = "v", desc = "Toggle comment" },
      { ",s", "<plug>NERDCommenterSexy", mode = "n", desc = "Sexy comment" },
      { ",s", "<plug>NERDCommenterSexy", mode = "v", desc = "Sexy comment" },
    },
  },

  -- Surround
  {
    "vim-scripts/surround.vim",
    keys = {
      { "ds", desc = "Delete surrounding" },
      { "cs", desc = "Change surrounding" },
      { "ys", desc = "Add surrounding" },
      { "S", mode = "v", desc = "Surround visual selection" },
    },
  },

  -- Endwise (automatically add end)
  {
    "tpope/vim-endwise",
    event = "InsertEnter",
  },
}
