return {
	{
		"ThePrimeagen/harpoon",
		branch = "harpoon2",
		dependencies = { "nvim-lua/plenary.nvim" },
		config = function()
			local harpoon = require("harpoon")

			harpoon:setup({
				settings = {
					save_on_toggle = true,
					sync_on_ui_close = true,
					key = function()
						return vim.loop.cwd()
					end,
				},
			})

			vim.keymap.set("n", "<M-i>", function()
				harpoon:list():add()
			end)
			vim.keymap.set("n", "<M-o>", function()
				harpoon.ui:toggle_quick_menu(harpoon:list())
			end)

			vim.keymap.set("n", "<M-h>", function()
				harpoon:list():select(1)
			end)
			vim.keymap.set("n", "<M-j>", function()
				harpoon:list():select(2)
			end)
			vim.keymap.set("n", "<M-k>", function()
				harpoon:list():select(3)
			end)
			vim.keymap.set("n", "<M-l>", function()
				harpoon:list():select(4)
			end)
			vim.keymap.set("n", "<M-;>", function()
				harpoon:list():select(5)
			end)
		end,
	},
}
