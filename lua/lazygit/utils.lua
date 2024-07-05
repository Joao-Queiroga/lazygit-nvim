local M = {}

M.parse_cmd_args = function(args)
  local cmd_args = {}
  for _, arg in ipairs(args) do
    local parts = vim.split(arg, "=")
    if #parts == 1 then
      table.insert(cmd_args, parts[1])
    else
      cmd_args[parts[1]] = parts[2]
    end
  end
  return cmd_args
end

return M
