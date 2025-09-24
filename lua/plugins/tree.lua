return {
  {
    "stevearc/oil.nvim",
    lazy = false, -- 启动时加载
    priority = 1000, -- 高优先级加载
    dependencies = { { "nvim-mini/mini.icons", opts = {} } },
    config = function()
      vim.keymap.set("n", "_", "<cmd>Oil<cr>", { desc = "Open oil" })
      vim.keymap.set("n", "<leader>e", "<cmd>Oil<cr>", { desc = "Open oil file explorer" })

      require("oil").setup({
        default_file_explorer = true, -- 设置为默认文件浏览器
        columns = {
          "icon",
          "size",
        },
        buf_options = {
          buflisted = false,
          bufhidden = "hide",
        },
        win_options = {
          wrap = false,
          signcolumn = "no",
          cursorcolumn = false,
          foldcolumn = "0",
          spell = false,
          list = false,
          conceallevel = 3,
          concealcursor = "nvic",
        },
        delete_to_trash = true, -- 删除文件到垃圾桶
        skip_confirm_for_simple_edits = true,
        experimental_watch_for_changes = true,
        prompt_save_on_select_new_entry = false,
        cleanup_delay_ms = 2000,
        lsp_file_methods = {
          timeout_ms = 1000,
          autosave_changes = false,
        },
        constrain_cursor = "editable",
        keymaps = {
          ["g?"] = "actions.show_help",
          ["<CR>"] = "actions.select",
          ["<C-s>"] = "actions.select_vsplit",
          ["<C-h>"] = "actions.select_split",
          ["<C-t>"] = "actions.select_tab",
          ["<C-p>"] = "actions.preview",
          ["<C-c>"] = "actions.close",
          ["<C-l>"] = "actions.refresh",
          ["-"] = "actions.parent",
          ["_"] = "actions.open_cwd",
          ["`"] = "actions.cd",
          ["~"] = "actions.tcd",
          ["gs"] = "actions.change_sort",
          ["gx"] = "actions.open_external",
          ["g."] = "actions.toggle_hidden",
          ["g\\"] = "actions.toggle_trash",
          -- 复制文件名和路径的快捷键
          ["yy"] = "actions.copy_entry_filename", -- 复制文件名
          ["yp"] = "actions.copy_entry_path", -- 复制绝对路径
          ["yr"] = { -- 复制相对路径 (自定义实现)
            callback = function()
              local oil = require("oil")
              local entry = oil.get_cursor_entry()
              if entry then
                local dir = oil.get_current_dir()
                if dir and entry.name then
                  local full_path = dir .. entry.name
                  local relative_path = vim.fn.fnamemodify(full_path, ":~:.")
                  vim.fn.setreg("+", relative_path)
                  vim.notify("Copied relative path: " .. relative_path)
                end
              end
            end,
            desc = "Copy entry relative path",
          },
        },
        use_default_keymaps = true,
        view_options = {
          show_hidden = false, -- 默认不显示隐藏文件，用 g. 切换
          is_hidden_file = function(name, bufnr)
            return vim.startswith(name, ".")
          end,
          is_always_hidden = function(name, bufnr)
            -- 始终隐藏的文件
            local always_hidden = {
              "%.DS_Store",
              "%.git$",
              "node_modules$",
              "%.next$",
              "%.cache$",
              "__pycache__$",
              "%.pyc$",
              "%.pyo$",
            }

            for _, pattern in ipairs(always_hidden) do
              if name:match(pattern) then
                return true
              end
            end
            return false
          end,
          sort = {
            { "type", "asc" }, -- 文件夹优先
            { "name", "asc" },
          },
        },
        float = {
          padding = 2,
          max_width = 0.9,
          max_height = 0.9,
          border = "rounded",
          win_options = {
            winblend = 0,
          },
          override = function(conf)
            return conf
          end,
        },
        preview = {
          max_width = 0.9,
          min_width = { 40, 0.4 },
          width = nil,
          max_height = 0.9,
          min_height = { 5, 0.1 },
          height = nil,
          border = "rounded",
          win_options = {
            winblend = 0,
          },
          update_on_cursor_moved = true,
        },
        progress = {
          max_width = 0.9,
          min_width = { 40, 0.4 },
          width = nil,
          max_height = { 10, 0.9 },
          min_height = { 5, 0.1 },
          height = nil,
          border = "rounded",
          minimized_border = "none",
          win_options = {
            winblend = 0,
          },
        },
      })

      -- 如果没有参数启动 nvim，自动打开当前目录
      vim.api.nvim_create_autocmd("VimEnter", {
        callback = function()
          if vim.fn.argc() == 0 then
            vim.cmd("Oil")
          end
        end,
      })
    end,
  },
  {
    "SirZenith/oil-vcs-status",
    enabled = false,
    dependencies = {
      "stevearc/oil.nvim",
    },
    config = function()
      local status_const = require("oil-vcs-status.constant.status")

      local StatusType = status_const.StatusType

      require("oil-vcs-status").setup({
        status_symbol = {
          [StatusType.Added] = "",
          [StatusType.Copied] = "󰆏",
          [StatusType.Deleted] = "",
          [StatusType.Ignored] = "",
          [StatusType.Modified] = "",
          [StatusType.Renamed] = "",
          [StatusType.TypeChanged] = "󰉺",
          [StatusType.Unmodified] = " ",
          [StatusType.Unmerged] = "",
          [StatusType.Untracked] = "",
          [StatusType.External] = "",

          [StatusType.UpstreamAdded] = "󰈞",
          [StatusType.UpstreamCopied] = "󰈢",
          [StatusType.UpstreamDeleted] = "",
          [StatusType.UpstreamIgnored] = " ",
          [StatusType.UpstreamModified] = "󰏫",
          [StatusType.UpstreamRenamed] = "",
          [StatusType.UpstreamTypeChanged] = "󱧶",
          [StatusType.UpstreamUnmodified] = " ",
          [StatusType.UpstreamUnmerged] = "",
          [StatusType.UpstreamUntracked] = " ",
          [StatusType.UpstreamExternal] = "",
        },
      })
    end,
  },
  {
    "cbochs/grapple.nvim",
    opts = {
      scope = "git", -- also try out "git_branch"
    },
    event = { "BufReadPost", "BufNewFile" },
    dependencies = {
      "stevearc/oil.nvim",
    },
    cmd = "Grapple",
    keys = {
      { "<leader>m", "<cmd>Grapple toggle<cr>", desc = "Grapple toggle tag" },
      { "<leader>K", "<cmd>Grapple toggle_scopes<cr>", desc = "Grapple toggle scopes" },
      { "<leader>j", "<cmd>Grapple cycle forward<cr>", desc = "Grapple cycle forward" },
      { "<leader>J", "<cmd>Grapple cycle backward<cr>", desc = "Grapple cycle backward" },
      { "<leader>1", "<cmd>Grapple select index=1<cr>", desc = "Grapple select 1" },
      { "<leader>2", "<cmd>Grapple select index=2<cr>", desc = "Grapple select 2" },
      { "<leader>3", "<cmd>Grapple select index=3<cr>", desc = "Grapple select 3" },
      { "<leader>4", "<cmd>Grapple select index=4<cr>", desc = "Grapple select 4" },
    },
  },
}
