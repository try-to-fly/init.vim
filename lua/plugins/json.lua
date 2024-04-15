return {
  "Myzel394/jsonfly.nvim",

  dependencies = {
    "nvim-telescope/telescope.nvim",
  },
  setup = function()
    require("telescope").load_extension("jsonfly")
  end,
  keys = {
    {
      "<leader>gj",
      "<cmd>Telescope jsonfly<cr>",
      desc = "Open json(fly)",
      ft = { "json" },
      mode = "n",
    },
  },
}
