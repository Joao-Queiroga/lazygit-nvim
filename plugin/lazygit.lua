---@param opts table :h lua-guide-commands-create
local function lazygit(opts)
  local args = require("lazygit.utils").parse_cmd_args(opts.fargs)
  require("lazygit").open(args)
end

vim.api.nvim_create_user_command("LazyGit", lazygit, {
  nargs = "*",
})
