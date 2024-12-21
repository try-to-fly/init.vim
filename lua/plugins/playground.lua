return {
  "try-to-fly/js-playground.nvim",
  keys = {
    "<leader>r",
  },
  config = function()
    require("js_playground").setup_autocmds()
    vim.api.nvim_set_keymap(
      "n",
      "<leader>r",
      ":lua require('js_playground').run_js_code()<CR>",
      { noremap = true, silent = true }
    )
  end,
}
