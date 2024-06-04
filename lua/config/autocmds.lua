-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here
local function augroup(name)
  return vim.api.nvim_create_augroup("lazyvim_" .. name, { clear = true })
end

vim.api.nvim_create_autocmd("FileType", {
  group = augroup("wrap_spell"),
  pattern = { "gitcommit", "markdown" },
  callback = function()
    vim.opt_local.wrap = true
    vim.opt_local.spell = false
  end,
})

-- vim.api.nvim_create_autocmd({ "BufReadPost", "BufNewFile" }, {
--   pattern = { "*.js", "*.ts" },
--   callback = function()
--     vim.schedule(function()
--       require("import_folds").toggle_import_folds()
--     end)
--   end,
-- })
