return {
	"github/copilot.vim",
	config = function()
		vim.cmd('imap <silent><script><expr> <Tab> copilot#Accept("")')
	end
}
