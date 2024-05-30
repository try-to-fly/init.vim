local M = {}

function M.toggle_import_folds()
  local bufnr = vim.api.nvim_get_current_buf()
  local parser = vim.treesitter.get_parser(bufnr, "javascript")
  local tree = parser:parse()[1]
  local root = tree:root()

  local query = vim.treesitter.query.parse(
    "javascript",
    [[
  (import_statement) @import
  ]]
  )

  local start_line, end_line
  for id, node in query:iter_captures(root, bufnr, 0, -1) do
    local node_start_line, _, node_end_line, _ = node:range()
    if not start_line then
      start_line = node_start_line
    end
    end_line = node_end_line
  end

  if start_line and end_line then
    -- 模拟选择范围并执行 zc
    local command = string.format(":%d,%dnormal! zc", start_line + 1, end_line + 1)
    vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes(command .. "\n", true, false, true), "n", true)
  else
    print("No import statements found.")
  end
end

return M
