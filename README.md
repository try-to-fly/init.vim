# nvim 配置

### 如何使用

1. 安装nvim：brew install neovim
2. 拉取配置：git clone git@github.com:try-to-fly/init.vim.git ~/.config/nvim
3. 打开nvim：nvim
4. 安装插件：:PlugInstall
5. 重启nvim

### 基础快捷键

> 删除

1. di(：删除括号内的内容
2. ci(：删除括号内，然后编辑
3. di"：删除引号内的所有内容
4. daw: 删除整个单词
5. dw: 向后删除

> 插入

1. a
2. A
3. o
4. O

> 窗口管理: Ctrl+w 是 prefix 按键

1. v:垂直拆分窗口
2. s:水平拆分
3. (方向键):切换对应的窗口
4. q:关闭当前窗口
5. o:关闭当前窗口之外的所有窗口
6. T: 当前窗口移动到新标签页

> Buffer 管理

1. <leader> fb:buffers 查询
2. :bn:下一个
3. :bp:上一个
4. :bd:删除

> 查找
1. <Ctrl-l>：清除查询结果。

> 全局
1. 全选：ggVG
2. 全部复制：ggyG
3. 全部删除：ggdG

### 插件快捷键

#### 查找

#### git

1. <leader> gg：打开 lazygit

#### coc
1. gd：查看类型定义
2. <C-o>:返回

#### 注释

#### 终端

1. F12：开关浮动终端

#### 主题
1. dracula: https://draculatheme.com/vim
2. gruvbox8: https://github.com/lifepillar/vim-gruvbox8

### 常见问题

1. copilot 不提示了
   > 解决办法(临时)：执行：Copilot setup

### 参考

1. [Vim 多文件编辑：窗口](https://harttle.land/2015/11/14/vim-window.html)
2. [Nvim 文档](https://neovim.io/doc/user/)
3. [《VimL 语言编程指北路》目录](https://github.com/lymslive/vimllearn/blob/master/content.md)
4. [vim高尔夫](https://www.vimgolf.com/)


### 项目看板
![Alt](https://repobeats.axiom.co/api/embed/699f0efda694ce8c838047640a297b3acee71e1b.svg "Repobeats analytics image")
