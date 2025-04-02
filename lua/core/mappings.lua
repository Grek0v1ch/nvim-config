vim.g.mapleader = " "

vim.keymap.set('n', '<esc>', ':noh<CR>')

-- NeoTree
vim.keymap.set('n', '<leader>e', ':Neotree float focus<CR>')
vim.keymap.set('n', '<leader>o', ':Neotree float git_status<CR>')
