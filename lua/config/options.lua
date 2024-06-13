-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
-- 允许系统剪切板访问
vim.o.clipboard = "unnamed"
vim.o.wrap = true

-- 判断是否是Linux环境
if vim.loop.os_uname().sysname == "Linux" then
  vim.o.clipboard = "unnamedplus"
  vim.g.clipboard = {
    name = "OSC 52",
    copy = {
      ["+"] = require("vim.ui.clipboard.osc52").copy("+"),
      ["*"] = require("vim.ui.clipboard.osc52").copy("*"),
    },
    paste = {
      ["+"] = require("vim.ui.clipboard.osc52").paste("+"),
      ["*"] = require("vim.ui.clipboard.osc52").paste("*"),
    },
  }
end

-- vim.o.relativenumber = false

vim.api.nvim_create_autocmd("BufEnter", {
  callback = function()
    vim.opt.formatoptions = vim.opt.formatoptions - { "c", "r", "o" }
  end,
})

vim.api.nvim_set_keymap(
  "n",
  "<leader>i",
  ':lua require("import_folds").toggle_import_folds()<CR>',
  { noremap = true, silent = true }
)

require("js_playground").setup_autocmds()
vim.api.nvim_set_keymap(
  "n",
  "<leader>r",
  ":lua require('js_playground').run_js_code()<CR>",
  { noremap = true, silent = true }
)
