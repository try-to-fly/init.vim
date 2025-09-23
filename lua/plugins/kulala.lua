return {
  "mistweaverco/kulala.nvim",
  ft = { "http", "rest" },
  keys = {
    { "<leader>Rs", "<cmd>lua require('kulala').run()<cr>", desc = "Send request" },
    { "<leader>Ra", "<cmd>lua require('kulala').run_all()<cr>", desc = "Send all requests" },
    { "<leader>Rb", "<cmd>lua require('kulala').scratchpad()<cr>", desc = "Open scratchpad" },
    { "<leader>Rc", "<cmd>lua require('kulala').copy()<cr>", desc = "Copy request as cURL" },
    { "<leader>Ri", "<cmd>lua require('kulala').import()<cr>", desc = "Import from cURL" },
    { "<leader>Rq", "<cmd>lua require('kulala').close()<cr>", desc = "Close kulala window" },
    { "<leader>Rt", "<cmd>lua require('kulala').toggle_view()<cr>", desc = "Toggle between request and response" },
    { "<leader>Rp", "<cmd>lua require('kulala').jump_prev()<cr>", desc = "Jump to previous request" },
    { "<leader>Rn", "<cmd>lua require('kulala').jump_next()<cr>", desc = "Jump to next request" },
  },
  config = function()
    require("kulala").setup({
      -- 默认配置，保持插件的默认行为
    })
  end,
}