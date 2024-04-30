vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.cursorline = true
vim.opt.cursorlineopt = 'number'
vim.opt.expandtab = true
vim.opt.splitright = true
vim.opt.splitbelow = true
vim.o.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.softtabstop = 2
vim.opt.scrolloff = 16
vim.opt.signcolumn = 'yes:3'
-- vim.opt.background = 'dark' -- or "light" for light mode
vim.api.nvim_set_option("clipboard", "unnamed")

-- User commands
vim.api.nvim_create_user_command(
  'VimSettings',
  function()
    vim.cmd("vsplit ~/.config/nvim")
  end,
  {}
)

