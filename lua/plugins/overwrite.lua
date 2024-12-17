return {
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      "http",
    },
  },
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "sql-formatter",
      },
    },
  },
  {
    "nvim-neo-tree/neo-tree.nvim",
    opts = {
      window = {
        mappings = {
          ["A"] = "none",
          ["P"] = "none",
          ["l"] = "none",
          ["t"] = "none",
          ["w"] = "none",
          ["C"] = "none",
          ["z"] = "none",
          [">"] = "none",
          ["<"] = "none",
          ["o"] = "none",
          ["oc"] = "none",
          ["od"] = "none",
          ["og"] = "none",
          ["om"] = "none",
          ["on"] = "none",
          ["os"] = "none",
          ["ot"] = "none",
          ["#"] = "none",
          ["/"] = "none",
          ["<c-x>"] = "none",
          ["<bs>"] = "none",
          ["D"] = "none",
          ["[g"] = "none",
          ["]g"] = "none",
          ["S"] = "none",
          ["f"] = "none",
          ["fn"] = function(state)
            -- 参考:https://github.com/nvim-neo-tree/neo-tree.nvim/discussions/370#discussioncomment-7559074
            local node = state.tree:get_node()
            local filename = node.name
            vim.fn.setreg('"', filename)
            vim.notify("Copied: " .. filename)
          end,
          ["fr"] = function(state)
            local node = state.tree:get_node()
            local filepath = node:get_id()
            vim.fn.setreg('"', filepath)
            vim.notify("Copied: " .. filepath)
          end,
          ["fa"] = function(state)
            local node = state.tree:get_node()
            local filepath = node:get_id()
            local cwd = vim.loop.cwd()
            local relative_path = filepath:gsub("^" .. cwd .. "/", "")
            vim.fn.setreg('"', relative_path)
            vim.notify("Copied: " .. relative_path)
          end,
          ["ff"] = function(state)
            local node = state.tree:get_node()
            local filepath = node:get_id()
            -- 构造命令以在 Finder 中显示文件
            local command = "open -R '" .. filepath .. "'"
            -- 执行命令
            vim.fn.system(command)

            vim.notify("Opened in Finder: " .. filepath)
          end,
        },
      },
    },
  },
  {
    "nvim-telescope/telescope.nvim",
    event = "VeryLazy",
    opts = {
      defaults = {
        color_devicons = true,
        prompt_prefix = "🔍 ",
        scroll_strategy = "cycle",
        -- sorting_strategy = "ascending",
        layout_strategy = "flex",
        layout_config = {
          horizontal = {
            -- mirror = true,
            preview_cutoff = 100,
            preview_width = 0.6,
          },
          vertical = {
            -- mirror = true,
            preview_cutoff = 0.4,
          },
          flex = {
            flip_columns = 128,
          },
          height = 0.94,
          width = 0.86,
        },
      },
    },
  },

  {
    "debugloop/telescope-undo.nvim",
    dependencies = {
      "nvim-telescope/telescope.nvim",
    },
    keys = {
      { -- lazy style key map
        "<leader>u",
        "<cmd>Telescope undo<cr>",
        desc = "undo history",
      },
    },
    config = function()
      require("telescope").load_extension("undo")
    end,
  },
}
