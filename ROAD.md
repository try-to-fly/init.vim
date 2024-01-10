# 升级过程

## 已解决

### 1. ssh的剪切板复制

虽然`nvim10`支持了`osc52`的协议，但是目前还不稳定。

### 2. 类似`vscode`的冲突管理

> 解决办法：[diffview.nvim](https://github.com/sindrets/diffview.nvim): 不仅可以解决冲突，还可以查看给定文件的commit记录。

### 3. LSP不生效

> 解决办法：重启LSP: `:LspRestart` [我总是遇到旧的 linting 错误，并且直到我重新启动 neovim （使用lazyvim）后才会清除](https://www.reddit.com/r/neovim/comments/190gx7z/i_keep_getting_old_linting_errors_sticking_around/)

### 4. code action : `<leader>ca`

### 待解决

1. 换行时如何避免自动注释。
