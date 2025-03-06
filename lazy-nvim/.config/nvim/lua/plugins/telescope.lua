return {
  "nvim-telescope/telescope.nvim",
  opts = function()
    return {
      defaults = {
        require("telescope").setup({
          pickers = {
            find_files = {
              find_command = { "rg", "--files", "--sortr=modified" },
            },
          },
        }),
        path_display = {
          filename_first = {
            reverse_directories = true,
          },
        },
        mappings = {
          n = {
            ["d"] = require("telescope.actions").delete_buffer,
            ["q"] = require("telescope.actions").close,
          },
        },
      },
    }
  end,
  keys = {
    {
      "<leader>sG",
      function()
        require("telescope.builtin").live_grep(require("telescope.themes").get_ivy())
      end,
      desc = "Grep (cwd)",
    },
  },
}
