return {
  {
    "mistricky/codesnap.nvim",
    build = "make",
    opts = {
      watermark = "",
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
