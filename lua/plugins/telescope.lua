return {
  "nvim-telescope/telescope.nvim",
  version = "0.1.8",
  dependencies = { "nvim-lua/plenary.nvim" },
  config = function()
    local builtin = require('telescope.builtin')
    local previewers = require('telescope.previewers')

    function vim.getVisualSelection()
      vim.cmd('noau normal! "vy"')
      local text = vim.fn.getreg('v')
      vim.fn.setreg('v', {})

      text = string.gsub(text, "\n", "")
      if #text > 0 then
        return text
      else
        return ''
      end
    end

    local _bad = { ".*%bundle.js" } -- Put all filetypes that slow you down in this array
    local bad_files = function(filepath)
      for _, v in ipairs(_bad) do
        if filepath:match(v) then
          return false
        end
      end

      return true
    end

    local new_maker = function(filepath, bufnr, opts)
      opts = opts or {}
      if opts.use_ft_detect == nil then opts.use_ft_detect = true end
      opts.use_ft_detect = opts.use_ft_detect == false and false or bad_files(filepath)
      previewers.buffer_previewer_maker(filepath, bufnr, opts)
    end

    require("telescope").setup {
      defaults = {
        buffer_previewer_maker = new_maker,
      }
    }

    vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
    vim.keymap.set('n', '<leader>fi', builtin.find_files, {})
    vim.keymap.set('n', '<leader>fd', builtin.git_files, {})
    vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
    vim.keymap.set('v', '<leader>fs', function()
      local text = vim.getVisualSelection()
      builtin.live_grep({ default_text = text })
    end)
    vim.keymap.set('n', '<leader>fs', builtin.grep_string, {})
    vim.keymap.set('n', '<leader>f?', builtin.help_tags, {})
  end
}
