return {
  {
    "brenoprata10/nvim-highlight-colors",
    opts = {},
  },
  {
    "catppuccin/nvim",
    priority = 1000,
  },
  {
    "tiagovla/tokyodark.nvim",
  },
  {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    opts = {},
    config = function()
      vim.cmd([[colorscheme tokyonight]])
    end,
  },
  {
    "rebelot/kanagawa.nvim",
  },
  -- {
  --   "LazyVim/LazyVim",
  --   opts = {
  --     -- colorscheme = "catppuccin-mocha",
  --     colorscheme = "tokyonight",
  --   },
  -- },
}
