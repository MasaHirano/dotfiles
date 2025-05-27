-- This file serves as the init file for the lua folder structure
-- It is automatically loaded by Neovim

-- Module containing all configuration and initialization logic
local M = {}

function M.setup()
  -- Load any global utility functions here if needed

  -- Load module configurations
  require("config.options")
  require("config.autocmds")
  require("config.keymaps")

  -- Load config.local if it exists
  local config_local_path = vim.fn.stdpath("config") .. "/lua/config/local.lua"
  if vim.fn.filereadable(config_local_path) == 1 then
    require("config.local")
  end
end

return M
