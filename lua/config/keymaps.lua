-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
--

vim.api.nvim_set_keymap("n", "<Leader>cb", "", {
  noremap = true,
  silent = true,
  callback = function()
    local language = vim.fn.input("Language: ")
    -- 判断输入是否为空，为空则不添加语言
    local lines = language ~= "" and { "```" .. language, "", "```" } or { "```", "", "```" }
    vim.api.nvim_put(lines, "l", true, true)
    vim.api.nvim_command("normal! k")
  end,
})

vim.keymap.set("n", "<leader>sp", '<cmd>lua require("spectre").open_file_search({select_word=true})<CR>', {
  desc = "Search on current file",
})
