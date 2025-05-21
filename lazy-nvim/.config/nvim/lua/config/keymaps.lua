vim.g.mapleader = " "
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)
vim.keymap.set("n", "<leader>b", "<cmd>silent :b#<CR>")

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

vim.keymap.set("n", "J", "mzJ`z")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

vim.keymap.set("n", "<leader>vwm", function()
  require("vim-with-me").StartVimWithMe()
end)
vim.keymap.set("n", "<leader>svwm", function()
  require("vim-with-me").StopVimWithMe()
end)

-- open current file in chrome
-- vim.keymap.set("n", "<C-g>", ":silent !google-chrome-stable %")

-- greatest remap ever
vim.keymap.set("x", "<leader>p", [["_dP]])

-- next greatest remap ever : asbjornHaland
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])

vim.keymap.set({ "n", "v" }, "<leader>d", [["_d]])

-- This is going to get me cancelled
vim.keymap.set("i", "<C-c>", "<Esc>")

vim.keymap.set("n", "Q", "<nop>")
vim.keymap.set("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>")
vim.keymap.set("n", "<leader>f", vim.lsp.buf.format)

-- vim.keymap.set("n", "<C-k>", "<cmd>cnext<CR>zz")
-- vim.keymap.set("n", "<C-j>", "<cmd>cprev<CR>zz")
vim.keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz")
vim.keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz")

vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })

vim.keymap.set("n", "<leader>vpp", "<cmd>e ~/.dotfiles/nvim/.config/nvim/lua/theprimeagen/packer.lua<CR>")

vim.keymap.set("n", "<leader><leader>", function()
  vim.cmd("so")
end)

-- Telescope Commands
vim.keymap.set(
  "n",
  "<leader>o",
  "<cmd>Telescope buffers initial_mode=normal theme=ivy<cr>",
  { desc = "[P]Open telescope buffers" }
)
vim.keymap.set(
  "n",
  "<leader>vs",
  '<cmd>Telescope find_files search_dirs={"~/vaults"} theme=ivy<cr>',
  { desc = "Search Files (Vaults Directory)" }
)
vim.keymap.set(
  "n",
  "<leader>vz",
  '<cmd>Telescope live_grep search_dirs={"~/vaults"} theme=ivy<cr>',
  { desc = "Live Grep (Vaults Directory)" }
)

-- vim.keymap.set(
--   "n",
--   "<leader>",
--   '<cmd>Telescope live_grep search_dirs={"~/vaults"} theme=ivy<cr>',
--   { desc = "Live Grep (Vaults Directory)" }
-- )

----------------------------------------
--- OBSIDIAN VAULT WORKFLOW COMMANDS ---
----------------------------------------

-- convert note to template and remove leading white space
vim.keymap.set(
  "n",
  "<leader>vt",
  ":ObsidianTemplate note<cr> :lua vim.cmd([[1,/^\\S/s/^\\n\\{1,}//]])<cr>",
  { desc = "Starting Obsidian Template" }
)
-- strip date from note title and replace dashes with spaces
-- must have cursor on title
vim.keymap.set("n", "<leader>vf", ":s/\\(# \\)[^_]*_/\\1/ | s/-/ /g<cr>", { desc = "Re-format Note Title" })

-- Define the keybinding to run the script-like functionality
vim.keymap.set(
  "n",
  "<leader>vn",
  ":lua RunVNCommand()<CR>",
  { noremap = true, silent = true, desc = "Create New Note" }
)

vim.keymap.set(
  "n",
  "<leader>vg",
  ':!mv "%:p" ~/vaults/confirmed/<cr>:bd<cr>',
  { desc = "Move note to 'confirmed' folder" }
)
vim.keymap.set("n", "<leader>vcdn", ":!rm '%:p'<cr>:bd<cr>", { desc = "Confirm Delete Note" })

-- Create a new note, prompt for filename, and open in vertical split
function RunVNCommand()
  -- vim.cmd("!cd ~/vaults && git pull")
  -- Prompt for user input (the file name)
  vim.ui.input({ prompt = "Enter file name (e.g. 'javascript array map method'): " }, function(input)
    if input then
      -- Replace spaces with dashes and generate the formatted file name
      local file_name = input:gsub(" ", "-")
      local formatted_file_name = os.date("%Y-%m-%d") .. "_" .. file_name .. ".md"

      -- Define the full file path in the inbox directory
      local file_path = vim.fn.expand("~") .. "/vaults/inbox/" .. formatted_file_name

      -- Create the file using touch (in this case, using vim.fn.writefile to create the file)
      vim.fn.writefile({}, file_path)

      -- Open the file in a vertical split
      vim.cmd("vsplit " .. file_path)
    end
  end)
end
