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
  -- 关掉标题全宽背景条（RenderMarkdownH1Bg 等）
  {
    "MeanderingProgrammer/render-markdown.nvim",
    opts = {
      heading = {
        backgrounds = {},
      },
    },
  },
  -- 禁用 markdownlint：none-ls 源名是 markdownlint-cli2，nvim-lint 也会再跑一遍
  {
    "nvimtools/none-ls.nvim",
    optional = true,
    opts = function(_, opts)
      opts.sources = vim.tbl_filter(function(source)
        return not tostring(source.name or ""):find("markdownlint", 1, true)
      end, opts.sources or {})
      return opts
    end,
  },
  {
    "mfussenegger/nvim-lint",
    optional = true,
    opts = function(_, opts)
      opts.linters_by_ft = opts.linters_by_ft or {}
      local markdown = opts.linters_by_ft.markdown or {}
      opts.linters_by_ft.markdown = vim.tbl_filter(function(name)
        return not tostring(name):find("markdownlint", 1, true)
      end, markdown)
      return opts
    end,
  },
}
