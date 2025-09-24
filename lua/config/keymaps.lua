-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local LazyVim = require("lazyvim.util")

-- ===== 编辑增强 =====
-- 快速插入代码块
vim.api.nvim_set_keymap("n", "<Leader>cb", "", {
  noremap = true,
  silent = true,
  callback = function()
    local language = vim.fn.input("Language: ")
    local lines = language ~= "" and { "```" .. language, "", "```" } or { "```", "", "```" }
    vim.api.nvim_put(lines, "l", true, true)
    vim.api.nvim_command("normal! k")
  end,
})

-- 更好的行移动
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", { desc = "Move line down" })
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", { desc = "Move line up" })

-- 保持光标位置的 J
vim.keymap.set("n", "J", "mzJ`z", { desc = "Join lines" })

-- 更好的搜索体验
vim.keymap.set("n", "n", "nzzzv", { desc = "Next search result" })
vim.keymap.set("n", "N", "Nzzzv", { desc = "Previous search result" })

-- ===== 搜索和替换 =====
-- 注意: 这些快捷键需要 nvim-spectre 插件
-- 如果插件未安装，请先在 lua/plugins/editor.lua 中添加该插件
vim.keymap.set("n", "<leader>sf", '<cmd>lua require("spectre").open_file_search({select_word=true})<CR>', {
  desc = "Search on current file",
})

-- 格式化代码
vim.keymap.set({ "n", "v" }, "<leader>cf", function()
  LazyVim.format({ force = true })
end, { desc = "Format" })

-- ===== 快速导航 =====
-- 快速跳转到行首和行尾
vim.keymap.set({ "n", "v" }, "H", "^", { desc = "Go to line start" })
vim.keymap.set({ "n", "v" }, "L", "$", { desc = "Go to line end" })

-- ===== 实用工具 =====

-- 复制文件路径
vim.keymap.set("n", "<leader>fp", function()
  local path = vim.fn.expand("%:p")
  vim.fn.setreg("+", path)
  vim.notify("Copied path: " .. path)
end, { desc = "Copy file path" })

-- 复制相对路径
vim.keymap.set("n", "<leader>fr", function()
  local path = vim.fn.expand("%")
  vim.fn.setreg("+", path)
  vim.notify("Copied relative path: " .. path)
end, { desc = "Copy relative path" })

-- ===== 终端操作 =====

-- ===== 快速编辑 =====
-- 插入模式下的快速移动
vim.keymap.set("i", "<C-h>", "<Left>", { desc = "Move left" })
vim.keymap.set("i", "<C-l>", "<Right>", { desc = "Move right" })
vim.keymap.set("i", "<C-j>", "<Down>", { desc = "Move down" })
vim.keymap.set("i", "<C-k>", "<Up>", { desc = "Move up" })

-- 插入模式下删除单词
vim.keymap.set("i", "<C-w>", "<C-o>dw", { desc = "Delete word" })
