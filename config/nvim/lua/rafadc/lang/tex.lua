local keymap = vim.keymap
local opts = { noremap = true, silent = true }

keymap.set("n","<leader>lc", ":VimtexClean<CR>", {noremap = true})
keymap.set("n","<leader>ll", ":VimtexCompile<CR>", opts)
keymap.set("n","<leader>lv", ":VimtexView<CR>", opts)
keymap.set("n","<leader>lt", ":VimtexTocToggle<CR>", opts)

