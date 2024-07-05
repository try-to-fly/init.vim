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
    },
    keys = {
      {
        "<leader>cs",
        "<Esc><cmd>CodeSnap<CR>",
        desc = "Code snap",
        mode = "v",
      },
    },
  },
}
