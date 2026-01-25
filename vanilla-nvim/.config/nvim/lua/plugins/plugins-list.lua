-- Plugins
vim.pack.add {
  { src = 'https://github.com/neovim/nvim-lspconfig' },
  { src = 'https://github.com/mason-org/mason.nvim' },
  { src = 'https://github.com/mason-org/mason-lspconfig.nvim' },
  { src = 'https://github.com/nvim-treesitter/nvim-treesitter' },
  { src = 'https://github.com/m4xshen/autoclose.nvim' },
  { src = 'https://github.com/catppuccin/nvim' },
  { src = 'https://github.com/nvim-lualine/lualine.nvim' },
  { src = 'https://github.com/christoomey/vim-tmux-navigator' },
  { src = 'https://github.com/kylechui/nvim-surround' },
  { src = 'https://github.com/abecodes/tabout.nvim' },
  { src = 'https://github.com/saghen/blink.cmp' },
  { src = 'https://github.com/L3MON4D3/LuaSnip' },
  { src = 'https://github.com/rafamadriz/friendly-snippets' },
  { src = 'https://github.com/ibhagwan/fzf-lua' },
}

-- Iniitalize Plugins
require('autoclose').setup({
  options = {
    pair_spaces = true
  }
})
require("nvim-surround").setup()
require("tabout").setup()
require("luasnip.loaders.from_vscode").lazy_load()
require("blink.cmp").setup({
  signature = { enabled = true },
  fuzzy = { implementation = "prefer_rust" },
})
require("lualine").setup()
require("catppuccin").setup({
  transparent_background = true;
})

require("fzf-lua").setup({
  vim.api.nvim_set_keymap('n', '<leader>f', ':FzfLua files<CR>', { noremap = true, silent = true }),
  vim.api.nvim_set_keymap('n', '<leader>/', ':FzfLua live_grep<CR>', { noremap = true, silent = true }),
  vim.api.nvim_set_keymap('n', '<leader>b', ':FzfLua buffers<CR>', { noremap = true, silent = true }),
  vim.api.nvim_set_keymap('n', '<leader>h', ':FzfLua help_tags<CR>', { noremap = true, silent = true }),
})

-- LSP Config
require("mason").setup()
require("mason-lspconfig").setup({
  ensure_installed = { "lua_ls", "ts_ls", "svelte", "html", "cssls", "emmet_ls" }
})

vim.lsp.enable("lua_ls", "ts_ls", "svelte", "html", "cssls", "emmet_ls", "tailwindcss")
vim.diagnostic.config({
  -- virtual_lines = true
  virtual_lines = {
    current_line = true
  }
})

require 'nvim-treesitter'.setup({
  opts = {
    ensure_installed = { "svelte", "typescript", "javascript", "html", "css" },
    auto_install = true,
    highlight = {
      enable = true,
    },
  },
})

vim.api.nvim_create_autocmd({"BufEnter", "BufWinEnter"}, {
  pattern = {"*.svelte"},
  callback = function()
    vim.treesitter.start()
  end
})

-- Color Scheme
vim.cmd.colorscheme "catppuccin"
