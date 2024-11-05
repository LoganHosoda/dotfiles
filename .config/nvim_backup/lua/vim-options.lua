vim.cmd("set expandtab")
vim.cmd("set tabstop=2")
vim.cmd("set softtabstop=2")
vim.cmd("set shiftwidth=2")
vim.cmd("set number")
vim.cmd("set timeoutlen=50")
vim.cmd("set clipboard+=unnamedplus")
vim.g.mapleader = " "
vim.g.background = "light"

vim.opt.swapfile = false

vim.keymap.set("n", "<c-k>", ":wincmd k<cr>")
vim.keymap.set("n", "<c-j>", ":wincmd j<cr>")
vim.keymap.set("n", "<c-h>", ":wincmd h<cr>")
vim.keymap.set("n", "<c-l>", ":wincmd l<cr>")
vim.keymap.set("n", "<c-g>", function()
	vim.cmd('!google-chrome-stable "' .. vim.fn.expand("%:p") .. '"')
end, { desc = "open file in chrome" })

vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "<C-d>", "<C-d>zz")

vim.keymap.set("n", "<leader>h", ":nohlsearch<CR>")
vim.wo.number = true
