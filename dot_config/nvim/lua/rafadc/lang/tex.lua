local keymap = vim.keymap
local opts = { noremap = true, silent = true }

vim.api.nvim_set_var('vimtex_compiler_engine', 'lualatex')
vim.api.nvim_set_var('vimtex_quickfix_mode', 0)
vim.api.nvim_set_var('tex_flavor', 'latex')
vim.api.nvim_set_var('vimtex_compiler_latexmk_engines', { ["_"] = '-lualatex'})

keymap.set("n","<leader>lc", ":VimtexClean<CR>", {noremap = true})
keymap.set("n","<leader>ll", ":VimtexCompile<CR>", opts)
keymap.set("n","<leader>lv", ":VimtexView<CR>", opts)
keymap.set("n","<leader>lt", ":VimtexTocToggle<CR>", opts)
keymap.set("n","<leader>lo", ":VimtexCompileOutput<CR>", opts)

