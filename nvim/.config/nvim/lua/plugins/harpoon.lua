return {
  {
    "nvim-lua/plenary.nvim",
  },
  {
    "ThePrimeagen/harpoon",
    config = function()
      local mark = require('harpoon.mark')
      local ui = require('harpoon.ui')

      vim.keymap.set('n', '<leader>a', mark.add_file)
      vim.keymap.set('n', '<M-e>', ui.toggle_quick_menu)

      vim.keymap.set('n', '<M-1>', function () ui.nav_file(1) end)
      vim.keymap.set('n', '<M-2>', function () ui.nav_file(2) end)
      vim.keymap.set('n', '<M-3>', function () ui.nav_file(3) end)
      vim.keymap.set('n', '<M-4>', function () ui.nav_file(4) end)
      vim.keymap.set('n', '<M-5>', function () ui.nav_file(5) end)
      vim.keymap.set('n', '<M-6>', function () ui.nav_file(6) end)
      vim.keymap.set('n', '<M-7>', function () ui.nav_file(7) end)
      vim.keymap.set('n', '<M-8>', function () ui.nav_file(8) end)
      vim.keymap.set('n', '<M-9>', function () ui.nav_file(9) end)
    end
  }
}

