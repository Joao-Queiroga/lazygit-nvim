vim.api.nvim_create_user_command("Lazygit", function(opts)
  require("lazygit").open()
end, {})
