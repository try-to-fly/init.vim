return {
  "nvim-telescope/telescope-frecency.nvim",
  enabled = false,
  config = function()
    require("telescope").load_extension("frecency")
    vim.keymap.set("n", "<leader><leader>", "<Cmd>Telescope frecency<CR>")
  end,
}
