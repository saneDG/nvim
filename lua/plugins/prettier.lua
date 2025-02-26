return {
  "prettier/vim-prettier",
  run = "npm install",
  ft = { "javascript", "typescript", "html", "css", "json" },
  config = function()
    vim.g["prettier#quickfix_enabled"] = 0
    vim.g["prettier#autoformat"] = 1
  end
}
