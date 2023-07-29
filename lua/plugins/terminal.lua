return {
  "voldikss/vim-floaterm",
  config = function()
    vim.g.floaterm_shell = "zsh"
    vim.g.floaterm_keymap_toggle = "<F12>"
    -- 90% 宽度
    vim.g.floaterm_width = 0.9
    vim.g.floaterm_height = 0.9
    vim.api.nvim_set_keymap("n", "<F12>", ":FloatermToggle<CR>", { silent = true })
    vim.api.nvim_set_keymap("t", "<F12>", "<C-\\><C-n>:FloatermToggle<CR>", { noremap = true, silent = true })
  end,
}
