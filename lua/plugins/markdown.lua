return {
  { "jxnblk/vim-mdx-js" },
  {
    "SidOfc/mkdx",
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
  -- {
  --   "williamboman/mason.nvim",
  --   opts = function(_, opts)
  --     opts.ensure_installed = opts.ensure_installed or {}
  --     vim.list_extend(opts.ensure_installed, { "markdownlint", "marksman" })
  --   end,
  -- },
}
