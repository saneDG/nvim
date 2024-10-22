-- User commands
vim.api.nvim_create_user_command(
  'VimSettings',
  function()
    vim.cmd("vsplit ~/.config/nvim")
  end,
  {}
)

vim.api.nvim_create_user_command(
  'CopyPath',
  function()
    local filepath = vim.fn.expand('%')
    vim.fn.setreg('+', filepath)
  end,
  {}
)
