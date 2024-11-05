return {
  {
    "williamboman/mason.nvim",
    config = function()
      require('mason').setup()
    end
  },
  {
    "williamboman/mason-lspconfig.nvim",
    config = function()
      require('mason-lspconfig').setup({
        ensure_installed = { "lua_ls", "ts_ls", "emmet_ls" }
      })
    end
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
      local capabilities = require('cmp_nvim_lsp').default_capabilities()
      local lspconfig = require("lspconfig")

      -- Lua LS Setup
      lspconfig.lua_ls.setup({
        capabilities = capabilities,
      })

      -- TypeScript LS Setup
      lspconfig.ts_ls.setup({
        capabilities = capabilities,
      })

      -- Emmet LS Setup with extended filetypes
      lspconfig.emmet_ls.setup({
        capabilities = capabilities,
        filetypes = { "css", "eruby", "html", "javascript", "javascriptreact",
                      "less", "sass", "scss", "svelte", "pug",
                      "typescriptreact", "vue", "handlebars", "html-ejs", "ejs" }, -- Add hbs and ejs
        init_options = {
          html = {
            options = {
              ["bem.enabled"] = true,
            },
          },
        },
      })

      -- Key mappings
      vim.keymap.set('n', 'K', vim.lsp.buf.hover, {})
      vim.keymap.set('n', 'gd', vim.lsp.buf.definition, {})
      vim.keymap.set({ 'n' }, '<leader>ca', vim.lsp.buf.code_action, {})
    end
  },
}

