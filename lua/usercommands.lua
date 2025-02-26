local opts = { noremap = true, silent = true }

-- User commands
vim.api.nvim_create_user_command(
  'VimSettings',
  function()
    vim.cmd("vsplit ~/.config/nvim")
  end,
  {}
)

vim.api.nvim_create_user_command(
  'CopyPath',
  function()
    local filepath = vim.fn.expand('%')
    vim.fn.setreg('+', filepath)
  end,
  {}
)

-- vim.api.nvim_create_user_command("Rotate", function()
--   local vstart = vim.fn.getpos("'<")
--   local vend = vim.fn.getpos("'>")
-- 
--   local start_row, start_col = vstart[2] - 1, vstart[3] - 1
--   local end_row, end_col = vend[2] - 1, vend[3] - 1
-- 
--   if start_row > end_row or (start_row == end_row and start_col > end_col) then
--     start_row, end_row = end_row, start_row
--     start_col, end_col = end_col, start_col
--   end
-- 
--   local lines = vim.api.nvim_buf_get_lines(0, start_row, end_row + 1, false)
--   local text = table.concat(lines, "\n"):sub(start_col + 1, end_col + 1)
-- 
--   local words = {}
--   for word in text:gmatch("%S+") do
--     table.insert(words, word)
--   end
-- 
--   if #words > 1 then
--     table.insert(words, 1, table.remove(words))
--   end
-- 
--   local rotated_text = table.concat(words, " ")
-- 
--   vim.api.nvim_buf_set_text(0, start_row, start_col, end_row, end_col + 1, { rotated_text })
-- 
--   vim.fn.setpos("'<", { 0, start_row + 1, start_col + 1, 0 })
--   vim.fn.setpos("'>", { 0, start_row + 1, start_col + #rotated_text, 0 })
--   vim.cmd("normal! gv")
-- end, { nargs = 0, range = true })
-- 
-- vim.keymap.set("v", "<leader>n", "<Cmd>Rotate<CR>", { silent = true })
