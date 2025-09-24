local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  -- bootstrap lazy.nvim
  -- stylua: ignore
  vim.fn.system({ "git", "clone", "--filter=blob:none", "https://github.com/folke/lazy.nvim.git", "--branch=stable", lazypath })
end
vim.opt.rtp:prepend(vim.env.LAZY or lazypath)

require("lazy").setup({
  spec = {
    -- add LazyVim and import its plugins
    { "LazyVim/LazyVim", import = "lazyvim.plugins" },
    -- import any extras modules here
    -- import/override with your plugins
    { import = "plugins" },
  },
  rocks = { hererocks = true, enabled = false },

  defaults = {
    -- 启用懒加载以提升性能
    lazy = true,
    -- 推荐版本策略
    version = false, -- always use the latest git commit
    -- version = "*", -- try installing the latest stable version for plugins that support semver
  },
  install = {
    colorscheme = { "tokyonight", "catppuccin" },
    missing = true, -- 自动安装缺失的插件
  },
  checker = { enabled = false }, -- 不启用自动更新检查
  change_detection = {
    enabled = true,
    notify = false, -- 不显示文件更改通知，减少干扰
  },
  performance = {
    cache = {
      enabled = true,
    },
    reset_packpath = true, -- 重置包路径以提升性能
    rtp = {
      -- 禁用更多不必要的内置插件
      disabled_plugins = {
        "gzip",
        "matchit",
        "matchparen",
        "netrwPlugin",
        "tarPlugin",
        "tohtml",
        "tutor",
        "zipPlugin",
        "rplugin", -- 禁用远程插件支持
        "syntax", -- 使用 treesitter 替代内置语法高亮
        "synmenu",
        "optwin",
        "compiler",
        "bugreport",
        "ftplugin",
      },
    },
  },
  ui = {
    size = { width = 0.8, height = 0.8 },
    wrap = true, -- 在 UI 中换行
    border = "rounded",
  },
  dev = {
    path = "~/projects", -- 开发插件的路径
    patterns = {}, -- 开发模式匹配模式
    fallback = false, -- 如果找不到本地插件，不回退到 git
  },
})
