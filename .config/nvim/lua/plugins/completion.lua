-- Completion and snippets plugins
return {
  -- Deoplete (async completion)
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

  -- Snippets
  {
    "honza/vim-snippets",
    event = "InsertEnter",
  },
}
