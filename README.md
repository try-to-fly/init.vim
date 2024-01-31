# 如何使用

## 外部依赖

```bash
#---------------安装node环境和yarn ---------
# 安装nvm
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.5/install.sh | bash
# 配置淘宝镜像源
export NVM_NODEJS_ORG_MIRROR=http://npm.taobao.org/mirrors/node
# 安装node 20
nvm install 20
# 开启corepack
corepack enable

# ----------------安装lazygit----------------
wget https://github.com/jesseduffield/lazygit/releases/download/v0.40.2/lazygit_0.40.2_Linux_x86_64.tar.gz
tar -xf lazygit_0.40.2_Linux_x86_64.tar.gz
# 设置lazygit到环境变量中


# ----------------安装ripgrep----------------
wget https://github.com/BurntSushi/ripgrep/releases/download/13.0.0/ripgrep-13.0.0-x86_64-unknown-linux-musl.tar.gz
tar -xf ripgrep-13.0.0-x86_64-unknown-linux-musl.tar.gz

# ----------------安装fd----------------
wget https://github.com/sharkdp/fd/releases/download/v8.7.1/fd-v8.7.1-x86_64-unknown-linux-musl.tar.gz
tar -xf fd-v8.7.1-x86_64-unknown-linux-musl.tar.gz

# --------------- 安装nvim -----------------
curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim.appimage
chmod u+x nvim.appimag

# 如果不支持appimage，可以使用下面的命令
wget https://github.com/neovim/neovim/releases/latest/download/nvim-linux64.tar.gz
tar -xf nvim-linux64.tar.gz
```
