return {
  {
    "vhyrro/luarocks.nvim",
    enabled = true,
    priority = 1001, -- this plugin needs to run before anything else
    config = true,
    opts = {
      rocks = { "xml2lua" },
    },
  },
  {
    dir = ".",
    config = function()
      require("xml_preview").setup()
    end,
    opts = {
      rocks = { "xml2lua" },
    },
  },
}
