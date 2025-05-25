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

  local ok, _ = pcall(require, "config.local")
  if ok then
    print("Loaded config.local")
  end
end

return M
