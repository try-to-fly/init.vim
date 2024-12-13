return {
  {
    "vhyrro/luarocks.nvim",
    enabled = false,
    priority = 1001, -- this plugin needs to run before anything else
    config = true,
    opts = {
      rocks = { "xml2lua" },
    },
  },
  {
    -- dir = ".",
    "try-to-fly/xml-preview.nvim",
    enabled = false,
    config = function()
      require("xml_preview").setup()
    end,
    opts = {
      rocks = { "xml2lua" },
    },
  },
}
