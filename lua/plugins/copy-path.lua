return {
  "try-to-fly/project-info.nvim",
  dependencies = { { "nvim-telescope/telescope.nvim" } },
  config = function()
    require("telescope").load_extension("copypath")
  end,
}
