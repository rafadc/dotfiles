vim.g.mapleader = " "

local builtin = require('telescope.builtin')

vim.keymap.set('n', '<leader>pv', vim.cmd.Ex)

vim.keymap.set('n', '<leader>ff', ":Telescope smart_open<CR>")
vim.keymap.set('n', '<leader>fr', builtin.oldfiles)

vim.keymap.set('n', '<leader>sh', builtin.help_tags, {})

vim.keymap.set("n", "<leader>fk", ":Telescope keymaps<CR>")

local grugfar = require('grug-far')
vim.keymap.set('n', '<leader>sg', grugfar.open, { noremap = true, silent = true })

vim.keymap.set('n', '<leader>fu', '<cmd>UndotreeToggle<CR>', { noremap = true, silent = true })

