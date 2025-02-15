return {
  {
    "mistricky/codesnap.nvim",
    build = "make",
    opts = {
      watermark = "",
      bg_padding = 0,
    },
    cmd = {
      "CodeSnap",
      "CodeSnapHighlight",
    },
    keys = {
      {
        "<leader>cs",
        "<Esc><cmd>CodeSnap<CR>",
        desc = "Code snap",
        mode = "v",
      },
      {
        "<leader>cS",
        "<Esc><cmd>CodeSnapHighlight<CR>",
        desc = "Code snap Highlight",
        mode = "v",
      },
    },
  },
}
