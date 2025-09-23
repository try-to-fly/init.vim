return {
  "retran/meow.yarn.nvim",
  dependencies = { "MunifTanjim/nui.nvim" },
  config = function()
    require("meow.yarn").setup({
      -- Your custom configuration goes here
    })

    -- Using lua functions
    vim.keymap.set("n", "<leader>yt", function()
      require("meow.yarn").open_tree("type_hierarchy", "supertypes")
    end, { desc = "Yarn: Type Hierarchy (Super)" })
    vim.keymap.set("n", "<leader>yT", function()
      require("meow.yarn").open_tree("type_hierarchy", "subtypes")
    end, { desc = "Yarn: Type Hierarchy (Sub)" })
    vim.keymap.set("n", "<leader>yc", function()
      require("meow.yarn").open_tree("call_hierarchy", "callers")
    end, { desc = "Yarn: Call Hierarchy (Callers)" })
    vim.keymap.set("n", "<leader>yC", function()
      require("meow.yarn").open_tree("call_hierarchy", "callees")
    end, { desc = "Yarn: Call Hierarchy (Callees)" })
  end,
}
