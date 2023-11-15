return {
  "f-person/git-blame.nvim",
  config = function()
    vim.g.gitblame_enabled = 0
    vim.g.gitblame_date_format = "%r"
  end,
}
