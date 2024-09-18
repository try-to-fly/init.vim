local Util = require("lazyvim.util")
return {
  {
    "f-person/git-blame.nvim",
    config = function()
      vim.g.gitblame_enabled = 0
      vim.g.gitblame_date_format = "%r"
    end,
  },
  {
    "FabijanZulj/blame.nvim",
    config = function()
      require("blame").setup({
        date_format = "%m.%d",
      })
    end,
  },
  {
    "aaronhallaert/advanced-git-search.nvim",
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
    "echasnovski/mini-git",
    version = false,
    config = function()
      require("mini.git").setup()
    end,
  },
  {
    "NeogitOrg/neogit",
    dependencies = {
      "nvim-lua/plenary.nvim", -- required
      "sindrets/diffview.nvim", -- optional - Diff integration

      -- Only one of these is needed.
      "nvim-telescope/telescope.nvim", -- optional
      "ibhagwan/fzf-lua", -- optional
      "echasnovski/mini.pick", -- optional
    },
    config = true,
  },
}
