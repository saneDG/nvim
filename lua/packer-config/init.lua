require('packer').startup(function(use)
  use('wbthomason/packer.nvim')
  use('ellisonleao/gruvbox.nvim')
  use('moll/vim-bbye')
  use({
    'lewis6991/gitsigns.nvim',
    config = function()
      require('gitsigns').setup()
    end,
  })
  use({
    'jose-elias-alvarez/null-ls.nvim',
    config = function()
      require('null-ls').setup()
    end,
    requires = { 'nvim-lua/plenary.nvim' },
  })
  use('nvim-lua/plenary.nvim')
  use({
    'williamboman/nvim-lsp-installer',
    'neovim/nvim-lspconfig',
  })
  use({
    'kyazdani42/nvim-tree.lua',
    requires = {
      'kyazdani42/nvim-web-devicons', -- optional, for file icons
    },
    tag = 'nightly', -- optional, updated every week. (see issue #1193)
  })
  use({ 'akinsho/bufferline.nvim', tag = 'v2.*', requires = 'kyazdani42/nvim-web-devicons' })
end)
