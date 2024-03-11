return {
  "drop-stones/im-switch.nvim",
  dependencies = { "nvim-lua/plenary.nvim" },
  event = "VeryLazy",
  opts = {
    mac = {
      enabled = true,
      default_im = "com.apple.keylayout.ABC",
    },
  },
}
