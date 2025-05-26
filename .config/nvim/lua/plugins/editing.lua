-- Editing plugins
return {
  -- Deoplete (async completion) https://github.com/Shougo/deoplete.nvim
  {
    "Shougo/deoplete.nvim",
    event = "InsertEnter",
    build = ":UpdateRemotePlugins",
    init = function()
      vim.g["deoplete#enable_at_startup"] = 1
    end,
    cond = function()
      return vim.fn.has("nvim") == 1
    end,
  },

  -- Snippets https://github.com/honza/vim-snippets
  {
    "honza/vim-snippets",
    event = "InsertEnter",
  },

  -- Better comments https://github.com/preservim/nerdcommenter
  {
    "scrooloose/nerdcommenter",
    keys = {
      { ",,", "<plug>NERDCommenterToggle", mode = "n", desc = "Toggle comment" },
      { ",,", "<plug>NERDCommenterToggle", mode = "v", desc = "Toggle comment" },
      { ",s", "<plug>NERDCommenterSexy", mode = "n", desc = "Sexy comment" },
      { ",s", "<plug>NERDCommenterSexy", mode = "v", desc = "Sexy comment" },
    },
  },
}
