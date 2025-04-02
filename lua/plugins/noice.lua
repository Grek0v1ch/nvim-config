require('noice').setup({
	cmdline = {
		enabled = true,
		view = 'cmdline'
	},
	lsp = {
		hover = {
			enabled = true,
			view = 'popup',
		},
	},
	documentation = {
		view = 'hover'
	},
	presets = {
		lsp_doc_border = true,
	},
})
vim.api.nvim_create_autocmd("User", {
	pattern = "NoiceCmdlineLeave", -- Событие закрытия cmdline noice
	callback = function()
		vim.cmd("nohlsearch")
	end,
})
