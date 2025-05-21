return {
  "nvim-telescope/telescope.nvim",
  opts = function()
    local actions = require("telescope.actions")
    local builtin = require("telescope.builtin")

    -- Basic keymappings for telescope
    -- vim.keymap.set("n", "<C-p>", builtin.git_files, { desc = "Telescope find files" })
    -- vim.keymap.set("n", "<leader>pf", builtin.find_files, { desc = "Telescope find files" })
    -- vim.keymap.set("n", "<leader>ps", builtin.live_grep, { desc = "Telescope live grep" })

    -- Define the custom function
    local function open_and_resume(prompt_bufnr)
      actions.select_default(prompt_bufnr)
      builtin.resume()
      vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<Esc>", true, false, true), "n", false)
    end

    return {
      defaults = {
        require("telescope").setup({
          defaults = {
            file_ignore_patterns = {
              "node_modules",
              ".git",
            },
          },
          pickers = {
            find_files = {
              hidden = true,
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
            ["<S-o>"] = open_and_resume,
          },
          i = {
            -- Replace default <C-x> (horizontal split) with '-'
            ["-"] = require("telescope.actions").select_horizontal,
            -- Replace default <C-v> (vertical split) with '\'
            ["\\"] = require("telescope.actions").select_vertical,
            ["<S-o>"] = open_and_resume,
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
      "<leader>pf",
      function()
        require("telescope.builtin").find_files(require("telescope.themes"))
      end,
      desc = "Find File (CWD)",
    },
    {
      "<leader>pn",
      function()
        require("telescope.builtin").find_files(require("telescope.themes").get_ivy({ cwd = "~/vaults/" }))
      end,
      desc = "Find Files (Notes Directory)",
    },
    {
      "<leader>pz",
      function()
        require("telescope.builtin").live_grep(require("telescope.themes").get_ivy({ cwd = "~/vaults/" }))
      end,
      desc = "Live Grep (Notes Directory)",
    },
    {
      "<leader>pg",
      function()
        require("telescope.builtin").git_files(require("telescope.themes").get_ivy())
      end,
      desc = "Search Git Files",
    },
    {
      "<leader>ph",
      function()
        require("telescope.builtin").help_tags(require("telescope.themes").get_ivy())
      end,
      desc = "Find Help",
    },
    {
      "<leader>pH",
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
