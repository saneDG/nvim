return {
  "VonHeikemen/lsp-zero.nvim",
  branch = "v3.x",
  dependencies = {
    { "neovim/nvim-lspconfig" }, -- Required
    {
      "williamboman/mason.nvim",
    },
    { "williamboman/mason-lspconfig.nvim" }, -- Optional
    { "hrsh7th/nvim-cmp" },                  -- Required
    { "hrsh7th/cmp-nvim-lsp" },              -- Required
    { "L3MON4D3/LuaSnip" },                  -- Required
  },
  config = function()
    local lsp = require("lsp-zero")

    lsp.preset("recommended")

    require('mason').setup({})
    require('mason-lspconfig').setup({
      -- Replace the language servers listed here
      -- with the ones you want to install
      ensure_installed = { 'eslint' },
      handlers = {
        lsp.default_setup,
      },
    })

    require('lspconfig').lua_ls.setup(lsp.nvim_lua_ls())

    -- Fix Undefined global 'vim'
    lsp.configure('lua_ls', {
      settings = {
        Lua = {
          diagnostics = {
            globals = { 'vim' }
          }
        }
      }
    })


    local cmp = require('cmp')
    local cmp_action = require('lsp-zero').cmp_action()
    cmp.setup({
      window = {
        completion = cmp.config.window.bordered(),
        documentation = cmp.config.window.bordered(),
      },
      mapping = cmp.mapping.preset.insert({
        ['<C-p>'] = cmp_action.luasnip_jump_forward(),
        ['<C-n>'] = cmp_action.luasnip_jump_backward(),
        ['<C-y>'] = cmp.mapping.confirm({ select = true }),
        ["<C-Space>"] = cmp.mapping.complete(),
        ['<Tab>'] = nil,
        ['<S-Tab>'] = nil,
      })
    })

    -- disable completion with tab
    -- this helps with copilot setup
    -- This doesn't seem to work though
    -- cmp_mappings['<Tab>'] = nil
    -- cmp_mappings['<S-Tab>'] = nil

    lsp.set_sign_icons({
      error = 'E',
      warn = 'W',
      hint = 'H',
      info = 'I'
    })

    lsp.on_attach(function(client, bufnr)
      local opts = { buffer = bufnr, remap = false }

      vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
      vim.keymap.set("n", "gh", function() vim.lsp.buf.hover() end, opts)
      vim.keymap.set("n", "<leader>vws", function() vim.lsp.buf.workspace_symbol() end, opts)
      vim.keymap.set("n", "<leader>vd", function() vim.diagnostic.open_float() end, opts)
      vim.keymap.set("n", "<leader>dn", function() vim.diagnostic.goto_next() end, opts)
      vim.keymap.set("n", "<leader>dp", function() vim.diagnostic.goto_prev() end, opts)
      vim.keymap.set("n", "<leader>vca", function() vim.lsp.buf.code_action() end, opts)
      vim.keymap.set("n", "<leader>vrr", function() vim.lsp.buf.references() end, opts)
      vim.keymap.set("n", "<leader>vrn", function() vim.lsp.buf.rename() end, opts)
      vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end, opts)
      vim.keymap.set({ 'n', 'x' }, '<leader>f', function()
        vim.lsp.buf.format({ async = false, timeout_ms = 10000 })
      end)
    end)

    lsp.setup()

    vim.diagnostic.config({
      virtual_text = true
    })
  end
}
