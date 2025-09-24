return {
  {
    "dstein64/vim-startuptime",
    cmd = "StartupTime",
    init = function()
      vim.g.startuptime_tries = 10
    end,
    keys = {
      { "<leader>st", "<cmd>StartupTime<cr>", desc = "Startup Time" },
    },
  },
  {
    "pteroctopus/faster.nvim",
    event = "VeryLazy",
    config = function()
      require("faster").setup({
        behaviours = {
          bigfile = {
            features_disabled = {
              "illuminate",
              "matchparen",
              "lsp",
              "treesitter",
              "indent_blankline",
              "vimopts",
              "syntax",
              "filetype",
            },
            filesize = 2, -- 2MB
          },
        },
      })
    end,
  },
  {
    "tweekmonster/startuptime.vim",
    cmd = "StartupTime",
  },
}