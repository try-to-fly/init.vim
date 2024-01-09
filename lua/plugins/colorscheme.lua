return {
  {
    "catppuccin/nvim",
    priority = 1000,
    config = function()
      vim.cmd([[colorscheme catppuccin-mocha]])
    end,
  },
  {
    "tiagovla/tokyodark.nvim",
    opts = {
      -- custom options here
    },
    config = function(_, opts)
      require("tokyodark").setup(opts) -- calling setup is optional
      vim.cmd([[colorscheme tokyonight]])
    end,
  },
  {
    "folke/tokyonight.nvim",
  },
  {
    "rebelot/kanagawa.nvim",
  },
}
