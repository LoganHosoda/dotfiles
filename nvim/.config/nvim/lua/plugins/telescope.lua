return {
  {
    'nvim-telescope/telescope.nvim', tag = '0.1.8',
    dependencies = { 'nvim-lua/plenary.nvim' },
    config = function()
      local builtin = require('telescope.builtin')
      vim.keymap.set('n', '<leader>pf', builtin.find_files, { desc = 'Telescope find files' })
      vim.keymap.set('n', '<C-p>', builtin.git_files, { desc = 'Telescope find files' })
      vim.keymap.set('n', '<leader>ps', builtin.live_grep, { desc = 'Telescope live grep' })

      require('telescope').setup{
        defaults = {
          vimgrep_arguments = {
            '--hidden',
            '-uu' -- **This is the added flag**
          },
          file_ignore_patterns = {
            "node_modules",
          }
        },
        pickers = {
          find_files = {
            hidden = true,
          }
        }
      }
    end
  },
  {
    'nvim-telescope/telescope-ui-select.nvim',
    config = function()
      require("telescope").setup({
        extensions = {
          ["ui-select"] = {
            require("telescope.themes").get_dropdown {
            }
          }
        }
      })
      require("telescope").load_extension("ui-select")
    end
  },
}

