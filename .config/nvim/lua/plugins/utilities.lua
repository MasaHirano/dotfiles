-- Utility plugins
return {
  -- Unite
  {
    "Shougo/unite.vim",
    cmd = "Unite",
    dependencies = {
      -- Interactive command execution
      { "Shougo/vimproc.vim", build = "make" },
    },
  },

  -- QuickRun
  {
    "thinca/vim-quickrun",
    cmd = "QuickRun",
    keys = { { "<leader>r", "<cmd>QuickRun<cr>", desc = "QuickRun" } },
  },

  -- Reference viewer
  {
    "thinca/vim-ref",
    cmd = "Ref",
    dependencies = {
      -- Reference source for ri
      { "yuku-t/vim-ref-ri", ft = "ruby" },
    },
  },
}
