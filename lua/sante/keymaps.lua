local opts = { noremap = true, silent = true }
local keymap = vim.api.nvim_set_keymap

-- Remap <leader> --
vim.g.mapleader = ' '
vim.keymap.set('n', '<leader>pv', vim.cmd.Ex)

-- Insert --
--  jk to enter
keymap('i', 'jk', '<Esc>', opts)

-- Move Lines ↑ & ↓ --
keymap('n', 'K', ':m .-2<cr>==', opts)
keymap('n', 'J', ':m .+1<cr>==', opts)
keymap('v', 'K', ":m '<-2<cr>gv=gv", opts)
keymap('v', 'J', ":m '>+1<cr>gv=gv", opts)

