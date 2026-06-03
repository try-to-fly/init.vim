local function disable_lsp_autostart(opts)
  opts.setup = opts.setup or {}

  local function configure_only(server, server_opts, setup)
    if setup and setup(server, server_opts) then
      return true
    end
    vim.lsp.config(server, server_opts)
    return true
  end

  for server, setup in pairs(opts.setup) do
    if server ~= "*" then
      opts.setup[server] = function(name, server_opts)
        return configure_only(name, server_opts, setup)
      end
    end
  end

  local fallback_setup = opts.setup["*"]
  opts.setup["*"] = function(server, server_opts)
    return configure_only(server, server_opts, fallback_setup)
  end
end

return {
  {
    "antosha417/nvim-lsp-file-operations",
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    config = function()
      require("lsp-file-operations").setup()
    end,
  },
  {
    "neovim/nvim-lspconfig",
    opts = function(_, opts)
      opts.servers = opts.servers or {}
      opts.servers.nil_ls = vim.tbl_deep_extend("force", opts.servers.nil_ls or {}, {
        mason = false,
        settings = {
          ["nil"] = {
            nix = {
              flake = {
                autoArchive = true,
              },
            },
          },
        },
      })

      disable_lsp_autostart(opts)
    end,
  },
}
