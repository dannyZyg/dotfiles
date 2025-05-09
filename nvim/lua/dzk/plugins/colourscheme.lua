return {
  {
    "folke/tokyonight.nvim",
    enabled = false,
    lazy = false, -- make sure we load this during startup if it is your main colorscheme
    priority = 1000, -- make sure to load this before all the other start plugins
    config = function()
      vim.cmd([[colorscheme tokyonight]])
    end,
  },

  {
    "neanias/everforest-nvim",
    enabled = true,
    lazy = false, -- make sure we load this during startup if it is your main colorscheme
    priority = 1000, -- make sure to load this before all the other start plugins
    opts = {
      background = "soft",
    },
    config = function()
      vim.cmd.colorscheme("everforest")
      vim.o.background = "dark" -- or "light" for light mode
    end,
  },

  {
    "ellisonleao/gruvbox.nvim",
    enabled = false,
    lazy = false, -- make sure we load this during startup if it is your main colorscheme
    priority = 1000, -- make sure to load this before all the other start plugins
    opts = {
      background = "soft",
    },
    config = function()
      vim.o.background = "dark" -- or "light" for light mode
      vim.cmd.colorscheme("gruvbox")
    end,
  },
}
