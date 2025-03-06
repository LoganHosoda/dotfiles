-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- Exit from insert mode by pressing jj
vim.api.nvim_set_keymap("i", "jj", "<Esc>", { noremap = false })

-- Open telescope buffers menu with added customization
vim.api.nvim_set_keymap(
  "n",
  "<A-b>",
  "<cmd>Telescope buffers initial_mode=normal theme=ivy<cr>",
  { desc = "[P]Open telescope buffers" }
)
