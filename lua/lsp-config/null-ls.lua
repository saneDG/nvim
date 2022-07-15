require('null-ls').setup({
  cmd = { 'nvim', 'vim' },
  sources = {
    require('null-ls').builtins.formatting.stylua,
    require('null-ls').builtins.diagnostics.eslint,
    require('null-ls').builtins.formatting.prettier,
  },
})
