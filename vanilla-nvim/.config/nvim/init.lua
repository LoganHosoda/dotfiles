-- Plugins
vim.pack.add {
  { src = 'https://github.com/neovim/nvim-lspconfig' },
  { src = 'https://github.com/mason-org/mason.nvim' },
  { src = 'https://github.com/mason-org/mason-lspconfig.nvim' },
  { src = 'https://github.com/nvim-treesitter/nvim-treesitter' },
  { src = 'https://github.com/m4xshen/autoclose.nvim' },
  { src = 'https://github.com/catppuccin/nvim' },
  { src = 'https://github.com/christoomey/vim-tmux-navigator' },
  { src = 'https://github.com/kylechui/nvim-surround' },
  { src = 'https://github.com/abecodes/tabout.nvim' },
  { src = 'https://github.com/saghen/blink.cmp' },
  { src = 'https://github.com/L3MON4D3/LuaSnip' },
  { src = 'https://github.com/rafamadriz/friendly-snippets' },
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

-- Vim Settings
vim.o.winbar = "%{expand('%:.')}"
vim.opt.guicursor = "n-v-c-i:block"
vim.o.cursorcolumn = false
vim.o.undofile = true
vim.o.clipboard = "unnamedplus"
vim.o.laststatus = 0
vim.opt.expandtab = true
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.softtabstop = -1
vim.o.wrap = false
vim.o.scrolloff = 8
vim.o.sidescrolloff = 8
vim.o.number = true
vim.opt.autoindent = true
-- vim.opt.smartindent = true
vim.o.signcolumn = 'yes:1'
vim.o.winborder = "rounded"

-- Keymaps
vim.g.mapleader = " "
vim.keymap.set('n', '<leader>o', ':update<CR> :source<CR>')
vim.keymap.set('n', '<leader>ve', '<cmd>edit ~/.config/nvim/init.lua<CR>')
vim.keymap.set('n', '<leader>pv', '<cmd>Explore<CR>')
vim.keymap.set('n', '<C-h>', '<C-w>h')
vim.keymap.set('n', '<C-j>', '<C-w>j')
vim.keymap.set('n', '<C-k>', '<C-w>k')
vim.keymap.set('n', '<C-l>', '<C-w>l')
vim.keymap.set('n', '<S-h>', '<cmd>bp<CR>')
vim.keymap.set('n', '<S-l>', '<cmd>bn<CR>')
vim.keymap.set('n', '<space>y', function() vim.fn.setreg('+', vim.fn.expand('%:p')) end)
vim.keymap.set("n", "<space>c", function()
  vim.ui.input({}, function(c)
    if c and c ~= "" then
      vim.cmd("noswapfile vnew")
      vim.bo.buftype = "nofile"
      vim.bo.bufhidden = "wipe"
      vim.api.nvim_buf_set_lines(0, 0, -1, false, vim.fn.systemlist(c))
    end
  end)
end)
vim.cmd('autocmd BufNewFile,BufRead *.ejs set filetype=html')

-- LSP Keymaps
vim.keymap.set('n', '<leader>f', vim.lsp.buf.format)
vim.keymap.set('n', 'gd', vim.lsp.buf.definition)
vim.keymap.set('n', 'K', vim.lsp.buf.hover)
vim.keymap.set('n', '<leader>r', vim.lsp.buf.rename)
vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action)
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev)
vim.keymap.set('n', ']d', vim.diagnostic.goto_next)
vim.keymap.set('n', '<leader>ld', vim.diagnostic.open_float)
