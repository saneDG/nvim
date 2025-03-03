-- Make sure to setup `mapleader` and `maplocalleader` before
-- loading lazy.nvim so that mappings are correct.
-- This is also a good place to setup other settings (vim.opt)
local opts = { noremap = true, silent = true }
local keymap = vim.api.nvim_set_keymap

-- Remap <leader> --
vim.g.mapleader = ' '
vim.g.maplocalleader = ','
vim.keymap.set('n', '<leader>pv', "<CMD>Oil<CR>", { desc = "Open parent directory" })
vim.keymap.set('n', '<leader>h', ':wincmd h<cr>')
vim.keymap.set('n', '<leader>l', ':wincmd l<cr>')
vim.keymap.set('n', '<leader>j', ':wincmd j<cr>')
vim.keymap.set('n', '<leader>k', ':wincmd k<cr>')

-- Insert --
keymap('i', 'jk', '<Esc>', opts)

-- Move Lines ↑ & ↓ --
keymap('n', '<C-k>', ':m .-2<cr>==', opts)
keymap('n', '<C-j>', ':m .+1<cr>==', opts)
keymap('v', '<C-k>', ":m '<-2<cr>gv=gv", opts)
keymap('v', '<C-j>', ":m '>+1<cr>gv=gv", opts)
