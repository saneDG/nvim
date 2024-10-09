-- User commands
vim.api.nvim_create_user_command(
  'VimSettings',
  function()
    vim.cmd("vsplit ~/.config/nvim")
  end,
  {}
)
