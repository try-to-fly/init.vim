return {
  "otavioschwanck/arrow.nvim",
  dependencies = {
    { "echasnovski/mini.icons" },
  },
  keys = {
    ";",
  },
  opts = {
    show_icons = true,
    separate_by_branch = true,
    leader_key = ";", -- Recommended to be a single key
    buffer_leader_key = "m", -- Per Buffer Mappings
  },
}
