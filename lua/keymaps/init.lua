local opts = { noremap = true, silent = true }
local keymap = vim.api.nvim_set_keymap

-- Remap <leader> --
keymap('', '<Space>', '<Nop>', opts)
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- Insert --
--  jk to enter
keymap('i', 'jk', '<Esc>', opts)
keymap('t', '<Esc>', '<C-Bslash><C-n>', opts)

-- Move Lines ↑ & ↓ --
keymap('n', 'K', ':m .-2<cr>==', opts)
keymap('n', 'J', ':m .+1<cr>==', opts)
keymap('v', 'K', ":m '<-2<cr>gv=gv", opts)
keymap('v', 'J', ":m '>+1<cr>gv=gv", opts)

-- LSP diagnostics --
vim.keymap.set('n', '<leader>r', vim.diagnostic.open_float, opts)
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, opts)
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, opts)
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, opts)

-- NvimTree --
keymap('n', '<leader>e', ':NvimTreeToggle<cr>', opts)
keymap('n', '<leader>r', ':NvimTreeRefresh<cr>', opts)

-- bufferline --
keymap('n', '<C-l>', ':BufferLineCycleNext<cr>', opts)
keymap('n', '<C-h>', ':BufferLineCyclePrev<cr>', opts)
keymap('n', '<C-Q>q', ':Bdelete<cr>', opts)

-- NullLs --
vim.cmd([[ command! Format execute 'lua vim.lsp.buf.formatting()' ]])
keymap('n', '<leader>f', ':Format<cr>', opts)
