vim.g.mapleader = " "

local builtin = require('telescope.builtin')

vim.keymap.set('n', '<leader>pv', vim.cmd.Ex)

vim.keymap.set('n', '<leader>ff', builtin.find_files)
vim.keymap.set('n', '<leader>fr', builtin.oldfiles)
vim.keymap.set('n', '<leader>fg', builtin.live_grep)

vim.keymap.set('n', '<leader>sg', builtin.live_grep, {})
vim.keymap.set('n', '<leader>sh', builtin.help_tags, {})

