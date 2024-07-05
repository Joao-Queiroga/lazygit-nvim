local M = {}

function M.terminal_open(cmd)
  local Terminal = require("toggleterm.terminal").Terminal
  local config = { cmd = cmd, direction = "float" }
  local lazygit = Terminal:new(config)
  lazygit:open()
end

return M
