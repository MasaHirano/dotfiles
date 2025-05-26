-- Colorscheme: Gruvbox
return {
  "ellisonleao/gruvbox.nvim",
  config = function()
    -- Configure gruvbox theme options
    require("gruvbox").setup({
      undercurl = true,
      underline = true,
      bold = true,
      italic = {
        strings = true,
        comments = true,
        operators = false,
        folds = true,
      },
      strikethrough = true,
      invert_selection = false,
      invert_signs = false,
      invert_tabline = false,
      invert_intend_guides = false,
      contrast = "soft", -- can be "hard", "soft" or "medium"
      palette_overrides = {},
      overrides = {},
      dim_inactive = false,
      transparent_mode = false,
    })

    -- Try to load the colorscheme, fallback if not available
    local success, _ = pcall(vim.cmd, "colorscheme gruvbox")
    if not success then
      vim.cmd("colorscheme default")
      vim.notify("Gruvbox colorscheme not found, using default")
    end
  end,
}
