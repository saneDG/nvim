vim.cmd [[packadd packer.nvim]]

return require("packer").startup(function(use)
  use("wbthomason/packer.nvim")
  -- use("ellisonleao/gruvbox.nvim")
  use("sainnhe/sonokai")
  use("nvim-treesitter/nvim-treesitter", { run = ":TSUpdate" })
  use("nvim-treesitter/nvim-treesitter-context")
  use("nvim-lua/plenary.nvim")
  use({
    "nvim-telescope/telescope.nvim",
    tag = "0.1.4",
    requires = { "nvim-lua/plenary.nvim" },
  })
  use("theprimeagen/harpoon")
  use("mbbill/undotree")
  use("tpope/vim-fugitive")
  use {
    "VonHeikemen/lsp-zero.nvim",
    branch = "v3.x",
    requires = {
      -- LSP Support
      { "neovim/nvim-lspconfig" }, -- Required
      {
                                 -- Optional
        "williamboman/mason.nvim",
        run = function()
          pcall(vim.cmd, "MasonUpdate")
        end,
      },
      { "williamboman/mason-lspconfig.nvim" }, -- Optional
      -- Autocompletion
      { "hrsh7th/nvim-cmp" },              -- Required
      { "hrsh7th/cmp-nvim-lsp" },          -- Required
      { "L3MON4D3/LuaSnip" },              -- Required
    },
    use("Olical/conjure"),
    use("lewis6991/gitsigns.nvim")
  }
end)
