local mark = require("harpoon.mark")
local ui = require("harpoon.ui")

vim.keymap.set('n', '<leader>jj', ui.toggle_quick_menu)
vim.keymap.set('n', '<leader>ja', mark.add_file)

vim.keymap.set('n', '<C-j>', ui.nav_next)
vim.keymap.set('n', '<C-h>', ui.nav_prev)
