return {
  "NStefan002/screenkey.nvim",
  cmd = "Screenkey",
  version = "*",
  config = function()
    require("screenkey").setup({
      display_infront = {
        "Telescope*",
      },
    })
  end,
}
