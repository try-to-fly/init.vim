return {
  "drop-stones/im-switch.nvim",
  dependencies = { "nvim-lua/plenary.nvim" },
  event = "VeryLazy",
  enabled = vim.loop.os_uname().sysname == "Darwin",
  opts = {
    mac = {
      enabled = true,
      default_im = "com.apple.keylayout.ABC",
    },
    linux = {
      enabled = false,
    },
    windows = {
      enabled = false,
    },
  },
}
