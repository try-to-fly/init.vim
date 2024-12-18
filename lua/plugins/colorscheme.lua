return {
  {
    "brenoprata10/nvim-highlight-colors",
    event = "VeryLazy",
    opts = {
      enable_tailwind = true,
      enable_named_colors = true,
    },
  },
  {
    "catppuccin/nvim",
    priority = 1000,
  },
  {
    "tiagovla/tokyodark.nvim",
    lazy = true,
  },
  {
    "folke/tokyonight.nvim",
    lazy = true,
    priority = 1000,
    opts = {},
    config = function()
      vim.cmd([[colorscheme tokyonight]])
    end,
  },
  {
    "rebelot/kanagawa.nvim",
    lazy = true,
  },
  {
    "loctvl842/monokai-pro.nvim",
    lazy = true,
  },
  -- {
  --   "LazyVim/LazyVim",
  --   opts = {
  --     -- colorscheme = "catppuccin-mocha",
  --     colorscheme = "tokyonight",
  --   },
  -- },
  -- Lazy
}
