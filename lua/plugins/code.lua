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
  {
    "nvim-cmp",
    dependencies = {
      "supermaven-inc/supermaven-nvim",
      build = ":SupermavenUseFree", -- remove this line if you are using pro
      opts = {},
    },
    opts = function(_, opts)
      table.insert(opts.sources, 1, {
        name = "supermaven",
        group_index = 1,
        priority = 100,
      })
    end,
  },
}
