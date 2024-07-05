local M = {}

function M.terminal_open(cmd, config)
  local Terminal = require("toggleterm.terminal").Terminal
  config = config or { direction = "float" }
  config.cmd = cmd
  local lazygit = Terminal:new(config)
  lazygit:open()
end

return M
