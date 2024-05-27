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
  -- Lazy
  {
    "vague2k/huez.nvim",
    -- if you want registry related features, uncomment this
    -- import = "huez-manager.import"
    config = function()
      require("huez").setup({})
    end,
  },
}
