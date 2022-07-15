require('settings')
require('packer-config')
require('lsp-config.language-servers')
require('lsp-config.null-ls')
-- require('lsp-config.handlers')
require('plugins.nvim-tree')
require('plugins.bufferline')
require('keymaps')

vim.wo.number = true
vim.bo.expandtab = true
vim.bo.shiftwidth = 2
vim.bo.softtabstop = 2
