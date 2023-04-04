require('packer').startup(function(use)
  use('wbthomason/packer.nvim')
  use('ellisonleao/gruvbox.nvim')
  use('moll/vim-bbye')
  use('nvim-treesitter/nvim-treesitter')
  use('nvim-lua/plenary.nvim')
  use({
    'nvim-telescope/telescope.nvim',
    tag = '0.1.1',
    -- or                            , branch = '0.1.x',
    requires = { { 'nvim-lua/plenary.nvim' } },
  })
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
  use({
    'williamboman/nvim-lsp-installer',
    'neovim/nvim-lspconfig',
  })
  use({ 'akinsho/bufferline.nvim', tag = 'v2.*', requires = 'kyazdani42/nvim-web-devicons' })
end)
