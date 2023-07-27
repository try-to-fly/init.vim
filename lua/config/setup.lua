local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
  {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
      "MunifTanjim/nui.nvim",
    },
    config = function()
      require("neo-tree").setup({
        close_if_last_window = true,
        enable_git_status = true,
        use_libuv_file_watcher = true,
        follow_current_file = true,
        window = {
          width = 30,
          mappings = {
            ["m"] = {
              "move",
              config = {
                show_path = "absolute"
              }
            }
          }
        },
        filesystem = {
          filtered_items = {
            hide_dotfiles = false,
            hide_by_name = {
              "node_modules",
              ".git"
            }
          }
        }
      })

      vim.api.nvim_set_keymap('n', '<C-t>', ':Neotree toggle<CR>', { noremap = true, silent = true })
      vim.api.nvim_set_keymap('n', '<C-f>', ':Neotree reveal<CR>', { noremap = true, silent = true })
    end
  },
  {
    "kdheepak/lazygit.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    config = function()
      vim.g.lazygit_floating_window_scaling_factor = 1.0
			vim.g.lazygit_floating_window_winblend = 0
			vim.g.lazygit_use_neovim_remote = true
      vim.api.nvim_set_keymap('n', '<leader>gg', ':LazyGit<CR>', { noremap = true, silent = true })
    end
  },
})
