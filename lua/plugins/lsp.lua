return {
  {
    "VonHeikemen/lsp-zero.nvim",
    branch = "v4.x",
    lazy = true,
    config = false,
  },
  {
    'williamboman/mason.nvim',
    lazy = false,
    config = true,
  },
  {
    'L3MON4D3/LuaSnip',
  },
  {
    'rafamadriz/friendly-snippets'
  },
  {
    "stevearc/conform.nvim",
    opts = {
      formatters_by_ft = {
        python = { "black" },
      },
    },
  },
  {
    'hrsh7th/nvim-cmp',
    event = 'InsertEnter',
    dependencies = {
      { 'L3MON4D3/LuaSnip' },
      { 'rafamadriz/friendly-snippets' },
    },
    config = function()
      local cmp = require('cmp')
      local cmp_action = require('lsp-zero').cmp_action()
      local cmp_format = require('lsp-zero').cmp_format({ details = true })
      local luasnip = require('luasnip')

      require("luasnip.loaders.from_vscode").load()

      cmp.setup({
        sources = {
          { name = 'nvim_lsp' },
          {
            name = 'luasnip',
            option = { show_autosnippets = true }
          },
          { name = 'nvim_lsp_signature_help' }
        },
        snippet = {
          expand = function(args)
            require('luasnip').lsp_expand(args.body)
          end,
        },
        window = {
          completion = cmp.config.window.bordered(),
          documentation = cmp.config.window.bordered(),
        },
        mapping = cmp.mapping.preset.insert({
          ['<C-ö>'] = cmp_action.luasnip_jump_forward(),
          ['<C-ä>'] = cmp_action.luasnip_jump_backward(),
          ['<C-y>'] = cmp.mapping(function(fallback)
            if cmp.visible() then
              if luasnip.expandable() then
                luasnip.expand()
              else
                cmp.confirm({
                  select = true,
                })
              end
            else
              fallback()
            end
          end),
          ['<Esc>'] = cmp.mapping.abort(),
        }),
        formatting = cmp_format,
      })
    end
  },
  {
    'neovim/nvim-lspconfig',
    cmd = { 'LspInfo', 'LspInstall', 'LspStart' },
    event = { 'BufReadPre', 'BufNewFile' },
    dependencies = {
      { 'hrsh7th/cmp-nvim-lsp' },
      { 'williamboman/mason.nvim' },
      { 'williamboman/mason-lspconfig.nvim' },
    },
    init = function()
      -- Reserve a space in the gutter
      -- This will avoid an annoying layout shift in the screen
      vim.opt.signcolumn = 'yes'
    end,
    config = function()
      local lsp_defaults = require('lspconfig').util.default_config

      lsp_defaults.capabilities = vim.tbl_deep_extend(
        'force',
        lsp_defaults.capabilities,
        require('cmp_nvim_lsp').default_capabilities()
      )

      vim.api.nvim_create_autocmd('LspAttach', {
        desc = 'LSP actions',
        callback = function(event)
          local opts = { buffer = event.buf }

          vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
          vim.keymap.set("n", "gh", function() vim.lsp.buf.hover() end, opts)
          vim.keymap.set("n", "<leader>vws", function() vim.lsp.buf.workspace_symbol() end, opts)
          vim.keymap.set("n", "<leader>vd", function() vim.diagnostic.open_float() end, opts)
          vim.keymap.set("n", "<leader>dn", function() vim.diagnostic.goto_next() end, opts)
          vim.keymap.set("n", "<leader>dp", function() vim.diagnostic.goto_prev() end, opts)
          vim.keymap.set("n", "<leader>vca", function() vim.lsp.buf.code_action() end, opts)
          vim.keymap.set("n", "<leader>vrr", function() vim.lsp.buf.references() end, opts)
          vim.keymap.set("n", "<leader>vrn", function() vim.lsp.buf.rename() end, opts)
          vim.keymap.set("n", "<leader>vv", function() vim.diagnostic.setqflist() end, opts)
          vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end, opts)
          -- get clients, check filetype and fallback to python formatting with "black"
          vim.keymap.set({ 'n', 'x' }, '<leader>f', function()
            local clients = vim.lsp.get_clients({ bufnr = 0 })
            local supports_format = false

            for _, client in ipairs(clients) do
              if client.server_capabilities.documentFormattingProvider then
                supports_format = true
                break
              end
            end

            if supports_format then
              vim.lsp.buf.format({ async = false, timeout_ms = 10000 })
            elseif vim.bo.filetype == "python" then
              require("conform").format({ async = true })
            else
              vim.notify("No formatter available", vim.log.levels.WARN)
            end
          end, opts)
          --
          -- you configured formatter to check if lsp formatting is supported
          -- and fallback to black if not. To only use lsp-formatting use this:
          --
          -- vim.keymap.set({ 'n', 'x' }, '<leader>f', function()
          --   vim.lsp.buf.format({ async = false, timeout_ms = 10000 })
          -- end, opts)
          --
          -- this works for python:
          --
          -- vim.keymap.set({ 'n', 'x' }, '<leader>f', function()
          --   require("conform").format({ async = true, lsp_fallback = true })
          -- end, opts)
          --
        end,
      })

      require('mason-lspconfig').setup({
        ensure_installed = { 'clojure_lsp', 'lua_ls', 'pyright' },
        handlers = {
          function(server_name)
            require('lspconfig')[server_name].setup({})
          end,
        },
      })
    end
  }
}
