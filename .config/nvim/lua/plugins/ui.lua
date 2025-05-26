-- UI Plugins (bufferline, lualine, etc.)
return {
  --- bufferline https://github.com/akinsho/bufferline.nvim
  {
    "akinsho/bufferline.nvim",
    version = "*",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    event = "VeryLazy",
    config = function()
      require("bufferline").setup()
    end,
  },

  -- lualine https://github.com/nvim-lualine/lualine.nvim
  {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    event = "VeryLazy",
    config = function()
      require("lualine").setup()
    end,
  },

  -- File explorer https://github.com/nvim-tree/nvim-tree.lua
  {
    "nvim-tree/nvim-tree.lua",
    version = "*",
    lazy = false,
    dependencies = { "nvim-tree/nvim-web-devicons", },
    keys = {
      { "<leader>e", "<cmd>NvimTreeToggle<cr>", desc = "Toggle NvimTree" },
    },
    config = function()
      require("nvim-tree").setup()
    end,
  },

  -- Better whitespace https://github.com/ntpeters/vim-better-whitespace
  {
    "ntpeters/vim-better-whitespace",
    event = "BufReadPost",
  },
}
