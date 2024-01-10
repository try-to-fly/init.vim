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
    end,
  },
  {
    "vuki656/package-info.nvim",
    config = function()
      require("package-info").setup()
      require("telescope").load_extension("package_info")
    end,
  },
}
