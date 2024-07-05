---@class Config
local config = {}

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

---@param args table?
M.open = function(args)
  local terminal = require("lazygit.terminal")
  local cmd_args = ""
  for k, v in pairs(args) do
    if type(k) == "string" then
      cmd_args = cmd_args .. " --" .. k .. " " .. v
    end
  end
  local cmd = "lazygit" .. cmd_args
  return terminal.terminal_open(cmd)
end

return M
