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

-- bufferline --
keymap('n', '<leader>l', ':BufferLineCycleNext<cr>', opts)
keymap('n', '<leader>h', ':BufferLineCyclePrev<cr>', opts)
keymap('n', '<leader>L', ':BufferLineMoveNext<cr>', opts)
keymap('n', '<leader>H', ':BufferLineMovePrev<cr>', opts)
keymap('n', '<leader>w', ':Bdelete<cr>', opts)

-- split control --
-- keymap('n', '<leader>H', '<C-w>h', opts)
-- keymap('n', '<leader>L', '<C-w>l', opts)
-- keymap('n', '<leader>J', '<C-w>j', opts)
-- keymap('n', '<leader>K', '<C-w>k', opts)

-- NullLs --
-- vim.cmd([[ command! Format execute 'lua vim.lsp.buf.format() {async = true}' ]])
keymap('n', '<leader>f', ':lua vim.lsp.buf.format({ timeout_ms = 2000 })<cr>', opts)

-- Telescope fuzzyfind --
local builtin = require('telescope.builtin')

vim.keymap.set('n', 'ff', builtin.find_files, {})
vim.keymap.set('n', 'fg', builtin.live_grep, {})
vim.keymap.set('n', 'fs', builtin.grep_string, {})
vim.keymap.set('n', 'fh', builtin.search_history, {})
vim.keymap.set('n', 'fo', builtin.oldfiles, {})
vim.keymap.set('n', 'fb', builtin.buffers, {})
vim.keymap.set('n', 'f?', builtin.help_tags, {})
