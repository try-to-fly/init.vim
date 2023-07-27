return {
	"nvim-neo-tree/neo-tree.nvim",
	branch = "v3.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
		"MunifTanjim/nui.nvim",
	},
	config = function()
		require("neo-tree").setup({
			close_if_last_window = true,
			enable_git_status = true,
			use_libuv_file_watcher = true,
			follow_current_file = true,
			window = {
				width = 30,
				mappings = {
					["m"] = {
						"move",
						config = {
							show_path = "absolute"
						}
					}
				}
			},
			filesystem = {
				filtered_items = {
					hide_dotfiles = false,
					hide_by_name = {
						"node_modules",
						".git"
					}
				}
			}
		})

		vim.api.nvim_set_keymap('n', '<C-t>', ':Neotree toggle<CR>', { noremap = true, silent = true })
		vim.api.nvim_set_keymap('n', '<C-f>', ':Neotree reveal<CR>', { noremap = true, silent = true })
	end
}
