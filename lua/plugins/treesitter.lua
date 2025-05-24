require 'nvim-treesitter.configs'.setup {
	ensure_installed = { "lua", "rust", "python" },

	auto_install = true,
	higlight = {
		enabled = true,
	},
	folding = {
		enable = true,
		disable = { "gitcommit", "lua", "json" }
	}
}
