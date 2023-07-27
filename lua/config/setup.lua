local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
	{
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
	},
	{
		"kdheepak/lazygit.nvim",
		dependencies = {
			"nvim-lua/plenary.nvim",
		},
		config = function()
			vim.g.lazygit_floating_window_scaling_factor = 1.0
			vim.g.lazygit_floating_window_winblend = 0
			vim.g.lazygit_use_neovim_remote = true
			vim.api.nvim_set_keymap('n', '<leader>gg', ':LazyGit<CR>', { noremap = true, silent = true })
		end
	},
	{
		'nvim-telescope/telescope.nvim',
		tag = '0.1.2',
		dependencies = { 'nvim-lua/plenary.nvim' },
		config = function()
			local m = { noremap = true, nowait = true }
			local builtin = require('telescope.builtin');
			vim.keymap.set('n', '<leader>ff', builtin.find_files, m)
			vim.keymap.set('n', '<leader>fg', builtin.live_grep, m)
			vim.keymap.set('n', '<leader>fb', builtin.buffers, m)
			vim.keymap.set('n', '<leader>fr', builtin.oldfiles, m)
			vim.keymap.set('n', '<leader>fc', builtin.commands, m)
			vim.keymap.set('n', '<leader>fh', builtin.search_history, m) -- 注意: 'search_history' 可能不是 'telescope.builtin' 中的有效函数，你需要替换为正确的函数
			vim.keymap.set('n', '<leader>fm', builtin.git_status, m)
			vim.keymap.set('n', '<leader>fe', builtin.resume, m)
		end
	},
	{
		"catppuccin/nvim",
		priority = 1000,
		config = function()
			vim.cmd([[colorscheme catppuccin-mocha]])
		end
	},
	{
		'jxnblk/vim-mdx-js',
		{
			"instant-markdown/vim-instant-markdown",
			ft = { "markdown" },
			build = "yarn install",
			config = function()
				vim.g.instant_markdown_autostart = 0
			end,
		}
	},
	{
		'numToStr/Comment.nvim',
		config = function()
			require('Comment').setup()
		end
	},
	{
		"github/copilot.vim"
	},
	require("config.plugins.winbar"),
	require("config.plugins.terminal"),
	require("config.plugins.editor"),
	require("config.plugins.autocomplete").config,
	require("config.plugins.debugger"),
	require("config.plugins.lspconfig").config,
	require("config.plugins.treesitter"),
	require("config.plugins.yank"),
	require("config.plugins.tabline"),
	require("config.plugins.statusline")
})
