vim.opt.guicursor = ""

vim.opt.nu = true
vim.opt.relativenumber = true

vim.opt.splitright = true
vim.opt.splitbelow = true

-- Tabs
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true

-- Search and replace
vim.opt.hlsearch = false
vim.opt.incsearch = true
vim.opt.inccommand = "split" -- Shows a preview of the replace at the bottom

vim.opt.smartindent = true

vim.opt.wrap = false

vim.opt.scrolloff = 8

vim.g.mapleader = " "

vim.opt.clipboard = "unnamedplus"

vim.o.completeopt="menu,menuone,noinsert,noselect"

vim.opt.conceallevel = 1 -- Required for Obsidian

-- Block mode edit
vim.opt.virtualedit = "block"

-- Cleaning trailing whitespace
vim.api.nvim_create_autocmd({ "BufWritePre" }, {
    pattern = {"*"},
    callback = function()
      local save_cursor = vim.fn.getpos(".")
      pcall(function() vim.cmd [[%s/\s\+$//e]] end)
      vim.fn.setpos(".", save_cursor)
    end,
})

