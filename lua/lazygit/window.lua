local M = {}

M.open_win = function(cmd, opts)
  local buf = vim.api.nvim_create_buf(false, true)
  local win_height = math.ceil(vim.o.lines * opts.height)
  local win_width = math.ceil(vim.o.columns * opts.width)
  local row = math.ceil((vim.o.lines - win_height) * opts.y - 1)
  local col = math.ceil((vim.o.columns - win_width) * opts.x)

  local win = vim.api.nvim_open_win(buf, true, {
    relative = "editor",
    width = win_width,
    height = win_height,
    border = opts.border,
    row = row,
    col = col,
    style = "minimal",
  })
  vim.api.nvim_set_option_value("winhighlight", "NormalFloat:Normal", { win = win })
  vim.api.nvim_set_option_value("filetype", "lazygit", { buf = buf })

  vim.fn.termopen(cmd, {
    on_exit = function(_, code, _)
      if code ~= 0 then
        return
      end

      vim.api.nvim_win_close(win, true)
    end,
  })
  vim.cmd.startinsert()
  vim.wo.winbar = nil
end

return M
