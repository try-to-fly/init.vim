return {
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
}
