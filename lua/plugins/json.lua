return {
  {
    "Myzel394/jsonfly.nvim",

    dependencies = {
      "nvim-telescope/telescope.nvim",
    },
    setup = function()
      require("telescope").load_extension("jsonfly")
    end,
    keys = {
      {
        "<leader>gj",
        "<cmd>Telescope jsonfly<cr>",
        desc = "Open json(fly)",
        ft = { "json" },
        mode = "n",
      },
    },
  },
  {
    -- dir = "/Users/smile/Documents/try-to-fly/json-path-picker.nvim/",
    "try-to-fly/json-path-picker.nvim",
    config = function()
      vim.api.nvim_set_keymap(
        "n",
        "<leader>jp",
        [[<cmd>lua require('json_path_picker').pick_json_path()<CR>]],
        { noremap = true, silent = true }
      )
    end,
  },
}
