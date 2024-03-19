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
        -- delete_to_trash = true,
        skip_confirm_for_simple_edits = true,
        experimental_watch_for_changes = true,
        lsp_file_methods = {
          autosave_changes = true,
        },
        win_options = {
          signcolumn = "number",
        },
        view_options = {
          show_hidden = true,
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
  {
    "cbochs/grapple.nvim",
    opts = {
      scope = "git", -- also try out "git_branch"
    },
    event = { "BufReadPost", "BufNewFile" },
    dependencies = {
      "stevearc/oil.nvim",
    },
    cmd = "Grapple",
    keys = {
      { "<leader>m", "<cmd>Grapple toggle<cr>", desc = "Grapple toggle tag" },
      { "<leader>K", "<cmd>Grapple toggle_scopes<cr>", desc = "Grapple toggle scopes" },
      { "<leader>j", "<cmd>Grapple cycle forward<cr>", desc = "Grapple cycle forward" },
      { "<leader>J", "<cmd>Grapple cycle backward<cr>", desc = "Grapple cycle backward" },
      { "<leader>1", "<cmd>Grapple select index=1<cr>", desc = "Grapple select 1" },
      { "<leader>2", "<cmd>Grapple select index=2<cr>", desc = "Grapple select 2" },
      { "<leader>3", "<cmd>Grapple select index=3<cr>", desc = "Grapple select 3" },
      { "<leader>4", "<cmd>Grapple select index=4<cr>", desc = "Grapple select 4" },
    },
  },
}
