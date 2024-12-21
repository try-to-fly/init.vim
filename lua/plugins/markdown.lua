return {
  { "jxnblk/vim-mdx-js", ft = "markdown.mdx" },
  {
    "SidOfc/mkdx",
    enabled = false,
    config = function()
      -- 使用 Lua 配置 mkdx 插件（示例，根据实际情况调整）
      vim.g["mkdx#settings"] = {
        ["highlight"] = { ["enable"] = 1 },
        ["enter"] = { ["shift"] = 1 },
        ["links"] = { ["external"] = { ["enable"] = 1 } },
        ["toc"] = { ["text"] = "Table of Contents", ["update_on_write"] = 1 },
        ["fold"] = { ["enable"] = 1 },
      }

      -- 禁用 vim-polyglot 中的 markdown 支持
      vim.g.polyglot_disabled = "markdown"
    end,
  },
}
