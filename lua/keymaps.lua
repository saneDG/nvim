-- Make sure to setup `mapleader` and `maplocalleader` before
-- loading lazy.nvim so that mappings are correct.
-- This is also a good place to setup other settings (vim.opt)
local opts = { noremap = true, silent = true }
local keymap = vim.api.nvim_set_keymap

-- Remap <leader> --
vim.g.mapleader = ' '
vim.g.maplocalleader = ','

-- Remaps for nordic layout
keymap('n', 'H', '^', opts)
keymap('n', 'L', '$', opts)
keymap('v', 'H', '^', opts)
keymap('v', 'L', '$', opts)

-- delete to _ register, then P to not overwrite register
keymap('x', '<leader>p', '\"_dP', opts)

-- Move between splits
keymap('n', '<leader>h', ':wincmd h<cr>', opts)
keymap('n', '<leader>l', ':wincmd l<cr>', opts)
keymap('n', '<leader>j', ':wincmd j<cr>', opts)
keymap('n', '<leader>k', ':wincmd k<cr>', opts)

-- Insert --
keymap('i', 'jk', '<Esc>', opts)

-- Move Lines ↑ & ↓ --
keymap('n', '<C-k>', ':m .-2<cr>==', opts)
keymap('n', '<C-j>', ':m .+1<cr>==', opts)
keymap('v', '<C-k>', ":m '<-2<cr>gv=gv", opts)
keymap('v', '<C-j>', ":m '>+1<cr>gv=gv", opts)

vim.keymap.set('n', '<leader>pv', "<CMD>Oil<CR>", { desc = "Open parent directory" })
