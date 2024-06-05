return {
  {
    "vhyrro/luarocks.nvim",
    enabled = vim.loop.os_uname().sysname == "Darwin",
    priority = 1001, -- this plugin needs to run before anything else
    config = true,
    opts = {
      rocks = { "magick" },
    },
  },
  {
    "3rd/image.nvim",
    enabled = vim.loop.os_uname().sysname == "Darwin",
    dependencies = { "luarocks.nvim" },
    config = function()
      require("image").setup()
    end,
  },
}
