return {
  "HakonHarnes/img-clip.nvim",
  event = "BufEnter",
  opts = {
    -- add options here
    -- or leave it empty to use the default settings
  },
  keys = {
    -- suggested keymap
    { "<leader>p", "<cmd>PasteImage<cr>", desc = "Paste clipboard image" },
  },
}
