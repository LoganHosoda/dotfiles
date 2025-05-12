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
        ensure_installed = { "lua_ls", "emmet_ls", "cssls" }
      })
    end
  },
  {
    "pmizio/typescript-tools.nvim",
    dependencies = { "nvim-lua/plenary.nvim", "neovim/nvim-lspconfig" },
    opts = {
      -- Performance optimizations
      settings = {
        -- Memory usage optimization
        tsserver = {
          maxTsServerMemory = 2048, -- Limit memory to 2GB (adjust based on your system)
          disableAutomaticTypeAcquisition = true, -- Disable automatic @types package downloads
        },
        -- Performance features
        typescript = {
          suggest = {
            completeFunctionCalls = false, -- Disable function call completion
            autoImports = true, -- Keep auto-imports but could disable if needed
          },
          updateImportsOnFileMove = "never", -- Disable import path updates on file moves
          format = {
            enable = false, -- Disable automatic formatting to save resources
          },
          implementationsCodeLens = {
            enabled = false, -- Disable code lens features
          },
          referencesCodeLens = {
            enabled = false, -- Disable references code lens
          },
          -- Workspace optimization
          workspaceSymbols = {
            scope = "currentProject", -- Limit symbol search to current project only
          },
        },
        -- Disable various watchers
        js = {
          implicitProjectConfig = {
            checkJs = false, -- Don't type-check JS files
          },
        },
      },
      -- Set typescript-tools to only watch specific folders
      root_dir = function(fname)
        -- Optimize root directory detection to avoid analyzing too many files
        return require("lspconfig.util").root_pattern(
          "tsconfig.json",
          "package.json"
        )(fname)
      end,
    },
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
      local capabilities = require('cmp_nvim_lsp').default_capabilities()
      
      -- Limit capabilities to essential ones
      capabilities.workspace = {
        didChangeWatchedFiles = { dynamicRegistration = false }
      }
      
      local lspconfig = require("lspconfig")
      -- Lua LS Setup
      lspconfig.lua_ls.setup({
        capabilities = capabilities,
      })
      -- CSS LS Setup
      lspconfig.cssls.setup({
        capabilities = capabilities,
      })
      -- Emmet LS Setup with extended filetypes
      lspconfig.emmet_ls.setup({
        capabilities = capabilities,
        filetypes = {
          "css", "eruby", "html", "javascript", "javascriptreact",
          "less", "sass", "scss", "svelte", "pug",
          "typescriptreact", "vue", "handlebars", "html-ejs", "ejs"
        },
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
      
      -- Global LSP performance settings
      vim.lsp.set_log_level("error") -- Reduce logging
      
      -- Debounce LSP events to reduce server load
      vim.diagnostic.config({
        update_in_insert = false, -- Don't update diagnostics while typing
        virtual_text = {
          severity = { min = vim.diagnostic.severity.WARN }, -- Only show warnings and errors
        },
        severity_sort = true,
      })
    end
  },
}
