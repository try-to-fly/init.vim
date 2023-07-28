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
	require("config.plugins.tree"),
	require("config.plugins.git"),
	require("config.plugins.telescope"),
	require("config.plugins.theme"),
	require("config.plugins.markdown"),
	require("config.plugins.comment"),
	require("config.plugins.copilot"),
	require("config.plugins.winbar"),
	require("config.plugins.terminal"),
	require("config.plugins.editor"),
	require("config.plugins.autocomplete").config,
	require("config.plugins.debugger"),
	require("config.plugins.lspconfig").config,
	require("config.plugins.treesitter"),
	require("config.plugins.yank"),
	require("config.plugins.tabline"),
	require("config.plugins.snippets"),
	require("config.plugins.statusline"),
	require("config.plugins.fzf"),
	require("config.plugins.indent"),
	require("config.plugins.leap"),
	require("config.plugins.surround"),
	require("config.plugins.mason"),
	require("config.plugins.notify"),
	require("config.plugins.project"),
	require("config.plugins.scrollbar"),
	-- require("config.plugins.wilder")
})
