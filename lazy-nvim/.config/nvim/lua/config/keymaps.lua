-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- Exit from insert mode by pressing jj
vim.keymap.set("i", "jj", "<Esc>")

-- Move selected lines of code without having to delete and paste
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- Yank highlighted code to the clipboard with space + y
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])

-- Delete without saving to buffer
vim.keymap.set({ "n", "v" }, "<leader>d", [["_d]])

-- Quality of life remaps
vim.keymap.set("n", "<leader>b", "<cmd>silent :b#<CR>")
vim.keymap.set("n", "J", "mzJ`z")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")
vim.keymap.set("n", "<F6>", ":!cd ~/notes && git pull<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<C-n>", ":!~/notes/find_files.sh &<CR>", { noremap = true, silent = true })

-- Open telescope buffers menu with added customization
vim.keymap.set(
  "n",
  "<leader>o",
  "<cmd>Telescope buffers initial_mode=normal theme=ivy<cr>",
  { desc = "[P]Open telescope buffers" }
)
