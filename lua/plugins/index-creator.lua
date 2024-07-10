return {
  "try-to-fly/create-index.nvim",
  cmd = "CreateIndex",
  config = function()
    require("index_creator").setup()
  end,
}
