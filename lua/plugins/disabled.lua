local plugin_names = {
  "echasnovski/mini.pairs",
  "nvim-neo-tree/neo-tree.nvim",
  "lukas-reineke/headlines.nvim",
  "akinsho/bufferline.nvim",
}

local plugins = {}
for _, name in ipairs(plugin_names) do
  table.insert(plugins, { name, enabled = false })
end
return plugins
