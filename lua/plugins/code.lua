return {
  {
    "mistricky/codesnap.nvim",
    build = "make",
    opts = {
      watermark = "",
    },
    keys = {
      {
        "<leader>cs",
        "<cmd>CodeSnap<CR>",
        desc = "Code snap",
        mode = "v",
      },
    },
  },
}
