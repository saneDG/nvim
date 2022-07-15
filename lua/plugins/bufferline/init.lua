vim.opt.termguicolors = true
require('bufferline').setup({
  options = {
    numbers = 'none',
    offsets = {
      {
        filetype = 'NvimTree',
        highlight = 'Directory',
        text = '',
        text_align = 'left',
      },
    },
  },
})
