return {
  "jonarrien/telescope-cmdline.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-telescope/telescope.nvim",
  },
  keys = {
    { ":", "<cmd>Telescope cmdline<cr>", desc = "Cmdline" },
  },
  config = function(_, opts)
    require("telescope").setup(opts)
    require("telescope").load_extension("cmdline")
  end,
}
