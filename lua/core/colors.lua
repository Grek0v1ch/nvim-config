vim.opt.termguicolors = true

function SetColor(color)
	 color = color or 'ayu'
	 vim.cmd.colorscheme(color)
end
require('ayu').setup({
	mirage = false,
	overrides = {
		Normal = { bg = "None" },
		ColorColumn = { bg="#565b66" },
		SignColumn = { bg = "None" },
		Folded = { bg = "None" },
		FoldColumn = { bg = "None" },
		CursorLine = { bg = "None" },
		CursorColumn = { bg = "None" },
		WhichKeyFloat = { bg = "None" },
		VertSplit = { bg = "None" },
		LineNr = {fg = "#FF8F40"},
		-- FloatBorder = { bg="None", fg="#fcfafa"},
	},
})
SetColor()
