return {
  -- {
  --   "rebelot/kanagawa.nvim",
  --   config = function()
  --     vim.cmd("colorscheme kanagawa")
  --   end
  -- },
  -- {
  --   "EdenEast/nightfox.nvim",
  --   config = function()
  --     vim.cmd("colorscheme duskfox")
  --   end
  -- },
  -- {
  --   "rose-pine/neovim", name = "rose-pine",
  --   config = function()
  --   vim.cmd("colorscheme rose-pine-moon");
  --   end
  -- },
  {
    "catppuccin/nvim", name = "catppuccin",
    config = function()
      require('catppuccin').setup({
<<<<<<< HEAD
        transparent_background = true;
=======
        transparent_background = true
>>>>>>> 350f8794dfc72c15e1443c4ecab65b81e2131a93
      })
      vim.cmd("colorscheme catppuccin");
    end
  },
  -- {
  --   "shaunsingh/nord.nvim",
  --   config = function()
  --     vim.cmd("colorscheme nord")
  --   end
  -- }
}
