---@class Config
local opts = {
  border = "rounded",
  height = 0.8,
  width = 0.9,
  x = 0.5,
  y = 0.5,
}

---@class MyModule
local M = {}

---@type Config
M.opts = opts

---@param args Config?
-- you can define your setup function here. Usually configurations can be merged, accepting outside params and
-- you can also put some validation here for those.
M.setup = function(args)
  M.opts = vim.tbl_deep_extend("force", M.opts, args or {})
end

---@param args table?
M.open = function(args)
  local window = require("lazygit.window")
  local cmd_args = ""
  for k, v in pairs(args or {}) do
    if type(k) == "string" then
      cmd_args = cmd_args .. " --" .. k .. " " .. v
    end
  end
  local cmd = "lazygit" .. cmd_args
  return window.open_win(cmd, M.opts)
end

return M
