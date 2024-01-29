return {
  {
    "neovim/nvim-lspconfig",
    init = function()
      local keys = require("lazyvim.plugins.lsp.keymaps").get()
      -- disable a keymap
      keys[#keys + 1] = { "K", false }
      keys[#keys + 1] = { "<leader>ca", false }
      keys[#keys + 1] = { "gd", false }
      keys[#keys + 1] = { "<leader>cr", false }
    end,
  },
  {
    "nvimdev/lspsaga.nvim",
    config = function()
      vim.keymap.set({ "n", "t" }, "<leader>t", "<cmd>Lspsaga term_toggle<CR>", { desc = "Toggle LSP Saga Terminal" })
      vim.keymap.set("n", "K", "<cmd>Lspsaga hover_doc<CR>", { desc = "Lspsaga hover_doc" })
      vim.keymap.set({ "n", "v" }, "<leader>ca", "<cmd>Lspsaga code_action<CR>", { desc = "Lspsaga code action" })
      -- definition
      vim.keymap.set({ "n", "v" }, "gd", "<cmd>Lspsaga goto_definition<CR>", { desc = "Lspsaga Goto Definition" })
      vim.keymap.set(
        { "n", "v" },
        "gD",
        "<cmd>Lspsaga goto_type_definition<CR>",
        { desc = "Lspsaga Goto Type Definition" }
      )
      -- peek
      vim.keymap.set({ "n", "v" }, "gp", "<cmd>Lspsaga peek_definition<CR>", { desc = "Lspsaga Peek Definition" })
      vim.keymap.set(
        { "n", "v" },
        "gP",
        "<cmd>Lspsaga peek_type_definition<CR>",
        { desc = "Lspsaga Peek Type Definition" }
      )
      -- rename
      vim.keymap.set({ "n", "v" }, "<leader>cr", "<cmd>Lspsaga rename<CR>", { desc = "Lspsaga Rename" })

      require("lspsaga").setup({
        finder = {
          max_height = 1,
          max_width = 1,
        },
        floaterm = {
          height = 0.8,
          width = 0.8,
        },
        code_action = {
          show_server_name = true,
        },
        lightbulb = {
          enable = false,
        },
      })
    end,
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
      "nvim-tree/nvim-web-devicons",
    },
  },
  {
    "antosha417/nvim-lsp-file-operations",
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    config = function()
      require("lsp-file-operations").setup()
    end,
  },
}
