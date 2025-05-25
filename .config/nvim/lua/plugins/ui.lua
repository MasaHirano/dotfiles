-- UI Plugins (NERDTree, airline, etc.)
return {
  -- NERDTree
  {
    "scrooloose/nerdtree",
    cmd = { "NERDTree", "NERDTreeToggle" },
    keys = {
      { "<leader>nt", "<cmd>NERDTreeToggle<cr>", desc = "Toggle NERDTree" },
    },
  },

  -- Airline
  {
    "vim-airline/vim-airline",
    config = function()
      vim.g.airline_powerline_fonts = 1
    end,
  },

  -- Indent guides
  {
    "nathanaelkane/vim-indent-guides",
    event = "BufReadPost",
    config = function()
      -- Migrating configuration from your plugins_config.vim
      vim.g["indent_guides_enable_on_vim_startup"] = 1
      vim.g["indent_guides_auto_colors"] = 0

      -- Set up colors when the colorscheme is loaded
      vim.api.nvim_create_autocmd("ColorScheme", {
        pattern = "*",
        callback = function()
          vim.cmd("hi IndentGuidesOdd  ctermbg=237")
          vim.cmd("hi IndentGuidesEven ctermbg=236")
        end,
      })
    end,
  },

  -- Better whitespace
  {
    "ntpeters/vim-better-whitespace",
    event = "BufReadPost",
  },
}
