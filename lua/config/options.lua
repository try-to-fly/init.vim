-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
-- 允许系统剪切板访问
vim.o.clipboard = "unnamed"
vim.o.wrap = true

vim.opt.scrolloff = 5

-- 检测是否在 SSH 环境中
local function is_ssh_session()
  return vim.env.SSH_CONNECTION ~= nil or vim.env.SSH_TTY ~= nil
end

-- 在 SSH 环境中使用 OSC 52 协议
if is_ssh_session() then
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
