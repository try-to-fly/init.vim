return {
  { "eandrju/cellular-automaton.nvim" },
  { "mg979/vim-visual-multi" },
  {
    "kristijanhusak/vim-dadbod-ui",
    dependencies = {
      { "tpope/vim-dadbod", lazy = true },
      { "kristijanhusak/vim-dadbod-completion", ft = { "sql", "mysql", "plsql", "sqlite" }, lazy = true },
    },
    cmd = {
      "DBUI",
      "DBUIToggle",
      "DBUIAddConnection",
      "DBUIFindBuffer",
    },
    init = function()
      -- Your DBUI configuration
      vim.g.db_ui_use_nerd_fonts = 1
      vim.g.db_ui_default_query = 'select * from "{table}" limit 10'
      vim.g.db_ui_auto_execute_table_helpers = 1
      vim.g.db_ui_use_nvim_notify = 1
    end,
  },
  {
    "vuki656/package-info.nvim",
    config = function()
      require("package-info").setup()
      require("telescope").load_extension("package_info")
    end,
  },
  {
    "aaronhallaert/advanced-git-search.nvim",
    config = function()
      require("telescope").setup({
        extensions = {
          advanced_git_search = {},
        },
      })

      require("telescope").load_extension("advanced_git_search")
    end,
    dependencies = {
      "nvim-telescope/telescope.nvim",
      "tpope/vim-fugitive",
      "tpope/vim-rhubarb",
    },
  },
  {
    "mtdl9/vim-log-highlighting",
  },
  {
    "stevearc/oil.nvim",
    -- enabled = false,
    opts = {},
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      vim.keymap.set("n", "_", "<cmd>Oil<cr>", { desc = "Open oil" })
      require("oil").setup({
        columns = {
          "icon",
        },
      })
    end,
  },
  { "prisma/vim-prisma" },
}
