local function open_diffview(...)
  local args = { ... }
  local cmd = "DiffviewOpen"

  -- 如果有参数传递给函数
  if #args > 0 then
    -- 将参数添加到命令字符串中
    cmd = cmd .. " " .. table.concat(args, " ")
  end

  -- 执行命令
  vim.cmd(cmd)
end
_G.open_diffview = open_diffview

return {
  "sindrets/diffview.nvim",
  config = function()
    vim.api.nvim_set_keymap("n", "<leader>gf", ":DiffviewFileHistory %", { noremap = true, silent = true })

    -- 创建一个用户命令 DiffView，调用 Lua 函数并接受一个参数
    vim.api.nvim_create_user_command("DiffView", "lua open_diffview(<f-args>)", { nargs = "*" })

    -- 映射一个键位组合到用户命令，并在命令模式中等待用户输入
    vim.api.nvim_set_keymap("n", "<leader>gd", ":DiffView ", { noremap = true })
  end,
}
