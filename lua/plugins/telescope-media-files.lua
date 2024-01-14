return {
  "nvim-telescope/telescope-media-files.nvim",
  denpendencies = {
    "nvim-lua/plenary.nvim",
    "nvim-telescope/telescope.nvim",
    "nvim-lua/popup.nvim",
  },
  config = function()
    require("telescope").load_extension("media_files")
  end,
}
