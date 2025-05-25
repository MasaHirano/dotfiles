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

  -- Align
  { "vim-scripts/Align", cmd = "Align" },

  -- Better comments
  {
    "scrooloose/nerdcommenter",
    keys = {
      { "<leader>cc", "<plug>NERDCommenterComment", desc = "Comment" },
      { "<leader>cu", "<plug>NERDCommenterUncomment", desc = "Uncomment" },
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

  -- XML edit
  {
    "sukima/xmledit",
    ft = { "xml", "html" },
  },

  -- Submodes
  {
    "kana/vim-submode",
    event = "VeryLazy",
  },
}
