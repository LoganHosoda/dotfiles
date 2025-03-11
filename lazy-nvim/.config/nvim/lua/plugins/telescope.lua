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
            -- Replace default <C-x> (horizontal split) with '-'
            ["-"] = require("telescope.actions").select_horizontal,
            -- Replace default <C-v> (vertical split) with '\'
            ["\\"] = require("telescope.actions").select_vertical,
            ["d"] = require("telescope.actions").delete_buffer,
            ["q"] = require("telescope.actions").close,
          },
          i = {
            -- Add custom keybinding for opening in a new buffer
            ["<S-CR>"] = function(prompt_bufnr)
              local selection = require("telescope.actions").get_selected_entry()
              local filepath = selection.path
              -- Open the selected item in a new buffer
              vim.cmd("tabnew " .. filepath)
            end,
            -- Replace default <C-x> (horizontal split) with '-'
            ["-"] = require("telescope.actions").select_horizontal,
            -- Replace default <C-v> (vertical split) with '\'
            ["\\"] = require("telescope.actions").select_vertical,
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
    -- f = { require("config.utils").telescope_git_or_file, "Find Files (Root)" },
    -- map("<leader>o", require("telescope.builtin").buffers, "Buffers")
    -- {
    --   "<leader>gt", ":Telescope golang_test_files<cr>", desc = "Search golang Tests",
    -- },

    -- {
    --   "<leader>f",
    --   function()
    --     require("config.utils").telescope_git_or_file(require("telescope.themes").get_ivy())
    --   end,
    --   desc = "Find Files (Root)",
    -- },
    {
      "<leader>f",
      function()
        require("telescope.builtin").find_files(require("telescope.themes").get_ivy())
      end,
      desc = "Find File (CWD)",
    },
    {
      "<leader>sn",
      function()
        require("telescope.builtin").find_files(require("telescope.themes").get_ivy({ cwd = "~/notes" }))
      end,
      desc = "Find Files (Notes Directory)",
    },
    {
      "<leader>sl",
      function()
        require("telescope.builtin").live_grep(require("telescope.themes").get_ivy({ cwd = "~/notes" }))
      end,
      desc = "Live Grep (Notes Directory)",
    },
    {
      "<leader>sg",
      function()
        require("telescope.builtin").git_files(require("telescope.themes").get_ivy())
      end,
      desc = "Search Git Files",
    },
    {
      "<leader>sh",
      function()
        require("telescope.builtin").help_tags(require("telescope.themes").get_ivy())
      end,
      desc = "Find Help",
    },
    {
      "<leader>sH",
      function()
        require("telescope.builtin").highlights(require("telescope.themes").get_ivy())
      end,
      desc = "Find highlight groups",
    },
    {
      "<leader>sM",
      function()
        require("telescope.builtin").man_pages(require("telescope.themes").get_ivy())
      end,
      desc = "Map Pages",
    },
    {
      "<leader>so",
      function()
        require("telescope.builtin").oldfiles(require("telescope.themes").get_ivy())
      end,
      desc = "Open Recent File",
    },
    {
      "<leader>sR",
      function()
        require("telescope.builtin").registers(require("telescope.themes").get_ivy())
      end,
      desc = "Registers",
    },
    {
      "<leader>st",
      function()
        require("telescope.builtin").live_grep(require("telescope.themes").get_ivy())
      end,
      desc = "Live Grep",
    },
    {
      "<leader>sT",
      function()
        require("telescope.builtin").grep_string(require("telescope.themes").get_ivy())
      end,
      desc = "Grep String",
    },
    {
      "<leader>sk",
      function()
        require("telescope.builtin").keymaps(require("telescope.themes").get_ivy())
      end,
      desc = "Keymaps",
    },
    {
      "<leader>sC",
      function()
        require("telescope.builtin").commands(require("telescope.themes").get_ivy())
      end,
      desc = "Commands",
    },
    -- {
    --   "<leader>sl",
    --   function()
    --     require("telescope.builtin").resume(require("telescope.themes").get_ivy())
    --   end,
    --   desc = "Resume last search",
    -- },
    {
      "<leader>sc",
      function()
        require("telescope.builtin").git_commits(require("telescope.themes").get_ivy())
      end,
      desc = "Git commits",
    },
    {
      "<leader>sB",
      function()
        require("telescope.builtin").git_branches(require("telescope.themes").get_ivy())
      end,
      desc = "Git branches",
    },
    {
      "<leader>sm",
      function()
        require("telescope.builtin").git_status(require("telescope.themes").get_ivy())
      end,
      desc = "Git status",
    },
    {
      "<leader>sS",
      function()
        require("telescope.builtin").git_stash(require("telescope.themes").get_ivy())
      end,
      desc = "Git stash",
    },
    -- {
    --   "<leader>se",
    --   function()
    --     require("telescope.builtin").frecency(require("telescope.themes").get_ivy())
    --   end,
    --   desc = "Frecency",
    -- },
  },
}
