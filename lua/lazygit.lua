---@class Config
---@field direction 'float' | 'horizontal' | 'vertical'
local config = {
  direction = "float",
}

---@class MyModule
local M = {}

---@type Config
M.config = config

---@param args Config?
-- you can define your setup function here. Usually configurations can be merged, accepting outside params and
-- you can also put some validation here for those.
M.setup = function(args)
  M.config = vim.tbl_deep_extend("force", M.config, args or {})
end

---@param args string?
---@param config Config?
M.open = function(args, config)
  local terminal = require("lazygit.terminal")
  local cmd = "lazygit" .. (args or "")
  config = vim.tbl_deep_extend("force", M.config, config or {})
  return terminal.terminal_open(cmd, config)
end

return M
