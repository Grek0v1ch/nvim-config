-- Sntup language servers.
local lspconfig = require('lspconfig')
lspconfig.lua_ls.setup {
	settings = {
		Lua = {diagnostics = {globals = {'vim'}}}
	},
}
lspconfig.rust_analyzer.setup {
  settings = {
    ['rust-analyzer'] = {
            diagnostics = {
                enable = true,
                experimental = {
                    enable = true,
                },
            },
			formatting = {
				enable = false,
			},
    },
  },
}

lspconfig.texlab.setup {}

lspconfig.pylsp.setup {
	settings = {
		pylsp = {
			plugins = {
				pylint = {
					enabled = true,
				},
			},
		},
	},
}

-- Global mappings.
-- See `:help vim.diagnostic.*` for documentation on any of the below functions
local function open_loclist_and_set_mappings()
  -- Открываем location list с диагностикой
  vim.diagnostic.setloclist()
  -- Получаем ID окна с location list
  local loclist_win = vim.fn.getloclist(0, {winid = 0}).winid
  if loclist_win > 0 then
    -- Устанавливаем keymap только для этого окна
    vim.api.nvim_buf_set_keymap(
      vim.api.nvim_win_get_buf(loclist_win),
      'n',
      '<CR>',
      '<CR><CMD>lclose<CR>',
      {nowait = true, silent = true}
    )
  end
end
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev)
vim.keymap.set('n', ']d', vim.diagnostic.goto_next)
vim.keymap.set('n', '<leader>ld', open_loclist_and_set_mappings)

-- Use LspAttach autocommand to only map the following keys
-- after the language server attaches to the current buffer
vim.api.nvim_create_autocmd('LspAttach', {
    group = vim.api.nvim_create_augroup('UserLspConfig', {}),
    callback = function(ev)
        local opts = {buffer = ev.buf}
        vim.keymap.set('n', '<C-d>', vim.lsp.buf.declaration, opts)
        vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
        vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, opts)
        vim.keymap.set('n', '<Leader>lr', vim.lsp.buf.rename, opts)
        vim.keymap.set('n', '<Leader>lf', function() vim.lsp.buf.format {async = true} end, opts)
    end
})
