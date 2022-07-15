local opts = { noremap = true, silent = true }
local keymap = vim.api.nvim_set_keymap

-- Remap <leader> --
keymap('', '<Space>', '<Nop>', opts)
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- Insert --
--  jk to enter
keymap('i', 'jk', '<Esc>', opts)

-- NvimTree --
keymap('n', '<leader>e', ':NvimTreeToggle<cr>', opts)

-- bufferline --
keymap('n', '<C-l>', ':BufferLineCycleNext<cr>', opts)
keymap('n', '<C-h>', ':BufferLineCyclePrev<cr>', opts)
keymap('n', '<C-w>', ':Bdelete<cr>', opts)

-- NullLs --
vim.cmd([[ command! Format execute 'lua vim.lsp.buf.formatting()' ]])
keymap('n', '<leader>f', ':Format<cr>', opts)
