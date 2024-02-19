return {
  {
    "stevearc/oil.nvim",
    opts = {},
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      vim.keymap.set("n", "_", "<cmd>Oil<cr>", { desc = "Open oil" })
      require("oil").setup({
        columns = {
          "icon",
        },
        delete_to_trash = true,
        skip_confirm_for_simple_edits = true,
        lsp_rename_autosave = true,
        win_options = {
          signcolumn = "number",
        },
      })
    end,
  },
  {
    "SirZenith/oil-vcs-status",
    dependencies = {
      "stevearc/oil.nvim",
    },
  },
}
