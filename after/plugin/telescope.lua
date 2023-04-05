local builtin = require('telescope.builtin')

vim.keymap.set('n', 'ff', builtin.find_files, {})
vim.keymap.set('n', 'fd', builtin.git_files, {})
vim.keymap.set('n', 'fg', builtin.live_grep, {})
vim.keymap.set('n', 'fs', builtin.grep_string, {})
vim.keymap.set('n', 'f?', builtin.help_tags, {})

