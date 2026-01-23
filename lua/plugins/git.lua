local Util = require("lazyvim.util")
return {
  {
    "f-person/git-blame.nvim",
    event = "VeryLazy",
    opts = {
      -- your configuration comes here
      -- for example
      enabled = true, -- if you want to enable the plugin
      message_template = " <summary> • <date> • <author> • <<sha>>", -- template for the blame message, check the Message template section for more options
      date_format = "%Y-%m-%d %H:%M:%S", -- template for the date, check Date format section for more options
      virtual_text_column = 1, -- virtual text start column, check Start virtual text at column section for more options
    },
  },
  -- {
  --   "FabijanZulj/blame.nvim",
  --   config = function()
  --     require("blame").setup()
  --   end,
  -- },
  {
    "aaronhallaert/advanced-git-search.nvim",
    cmd = { "AdvancedGitSearch" },
    config = function()
      require("telescope").setup({
        extensions = {
          advanced_git_search = {},
        },
      })

      require("telescope").load_extension("advanced_git_search")
    end,
    dependencies = {
      "nvim-telescope/telescope.nvim",
      "tpope/vim-fugitive",
      "tpope/vim-rhubarb",
    },
  },
  {
    {
      "isak102/telescope-git-file-history.nvim",
      dependencies = { "tpope/vim-fugitive", "nvim-telescope/telescope.nvim" },
      config = function()
        require("telescope").load_extension("git_file_history")
      end,
      keys = function()
        return {
          { "<leader>gl", "<cmd>Telescope git_file_history<CR>", desc = "git_file_history" },
        }
      end,
    },
  },
  {
    "nvim-mini/mini-git",
    version = false,
    config = function()
      require("mini.git").setup()
    end,
  },
  -- Git Worktree 管理
  {
    "polarmutex/git-worktree.nvim",
    version = "^2",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-telescope/telescope.nvim",
    },
    config = function()
      local Hooks = require("git-worktree.hooks")
      local config = require("git-worktree.config")

      -- 切换 worktree 时更新缓冲区
      Hooks.register(Hooks.type.SWITCH, function(path, prev_path)
        vim.notify("从 " .. prev_path .. " 切换到 " .. path)
        Hooks.builtins.update_current_buffer_on_switch(path, prev_path)
      end)

      -- 删除 worktree 时刷新
      Hooks.register(Hooks.type.DELETE, function()
        vim.cmd(config.update_on_change_command)
      end)

      -- 加载 Telescope 扩展
      require("telescope").load_extension("git_worktree")
    end,
    keys = {
      {
        "<leader>gwl",
        "<cmd>Telescope git_worktree<cr>",
        desc = "列出 Worktrees",
      },
      {
        "<leader>gwc",
        function()
          require("git-worktree").create_worktree(
            vim.fn.input("Worktree 路径: "),
            vim.fn.input("分支名: "),
            "origin"
          )
        end,
        desc = "创建 Worktree",
      },
    },
  },
}
