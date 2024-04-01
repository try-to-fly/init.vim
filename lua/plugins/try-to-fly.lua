return {
  {
    "try-to-fly/project-info.nvim",
    dependencies = {
      { "nvim-telescope/telescope.nvim" },
      { "nvim-lua/plenary.nvim" },
    },
    config = function()
      require("telescope").load_extension("copypath")
    end,
  },
  {
    "try-to-fly/telescope-folder-list.nvim",
    dependencies = {
      { "nvim-telescope/telescope.nvim" },
      { "nvim-lua/plenary.nvim" },
    },
    config = function()
      require("telescope").load_extension("search_folders")
    end,
  },
}
