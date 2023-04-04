require('settings')
require('packer-config')
require('lsp-config.language-servers')
require('lsp-config.null-ls')
require('lsp-config.formatters')
-- require('lsp-config.handlers')
-- require('plugins.nvim-tree')
require('plugins.bufferline')
require('plugins.gitsigns')
require('keymaps')

vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.expandtab = true
vim.opt.shiftwidth = 2
vim.opt.softtabstop = 2
vim.opt.scrolloff = 10
