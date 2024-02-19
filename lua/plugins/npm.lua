return {
  {
    "vuki656/package-info.nvim",
    config = function()
      require("package-info").setup()
      require("telescope").load_extension("package_info")
    end,
  },
}
