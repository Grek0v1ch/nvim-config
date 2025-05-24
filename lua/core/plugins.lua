local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
	local lazyrepo = "https://github.com/folke/lazy.nvim.git"
	local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
	if vim.v.shell_error ~= 0 then
		vim.api.nvim_echo({
			{ "Failed to clone lazy.nvim:\n", "ErrorMsg" },
			{ out,                            "WarningMsg" },
			{ "\nPress any key to exit..." },
		}, true, {})
		vim.fn.getchar()
		os.exit(1)
	end
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
			-- {"3rd/image.nvim", opts = {}}, -- Optional image support in preview window: See `# Preview Mode` for more information
		},
		lazy = false, -- neo-tree will lazily load itself
		---@module "neo-tree"
		---@type neotree.Config?
		opts = {
			-- fill any relevant options here
		},
	}, {
	'nvim-treesitter/nvim-treesitter'
}, {
	'Shatur/neovim-ayu'
}, {
	'neovim/nvim-lspconfig'
}, {
	'williamboman/mason.nvim',
	build = ":MasonUpdate"
}, {
	'folke/noice.nvim'
}, {
	'nvim-telescope/telescope.nvim',
	tag = '0.1.8',
	dependencies = { 'nvim-lua/plenary.nvim' },
}, {
	'akinsho/bufferline.nvim', version = "*", dependencies = 'nvim-tree/nvim-web-devicons'
}, {
	'hrsh7th/nvim-cmp'
}, {
	'hrsh7th/cmp-buffer'
}, {
	'hrsh7th/cmp-path'
}, {
	'hrsh7th/cmp-cmdline'
}, {
	'hrsh7th/nvim-cmp'
}, {
	'hrsh7th/cmp-nvim-lsp'
}, {
	'kdheepak/lazygit.nvim'
}, {
	'puremourning/vimspector', build = ":VimspectorInstall",
}, {
	'akinsho/toggleterm.nvim', version = "*", config = true
}, {
	'preservim/tagbar'
}, {
  "lervag/vimtex",
  lazy = false,     -- we don't want to lazy load VimTeX
  -- tag = "v2.15", -- uncomment to pin to a specific release
  init = function()
    -- VimTeX configuration goes here, e.g.
    vim.g.vimtex_view_method = "zathura"
  end
}
})
