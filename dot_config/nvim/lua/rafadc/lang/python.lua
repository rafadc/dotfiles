vim.lsp.enable('pyright')

vim.api.nvim_create_autocmd("BufWritePre", {
    pattern = "*.py",
    callback = function()
        vim.lsp.buf.format({ async = false })
    end,
})

vim.api.nvim_create_autocmd("FileType", {
    pattern = "python",
    callback = function()
        vim.bo.tabstop = 4
        vim.bo.shiftwidth = 4
        vim.bo.expandtab = true
        vim.bo.softtabstop = 4

        vim.api.nvim_buf_set_keymap(0, 'n', '<F4>', ':update<CR>:!black %<CR>', {noremap = true, silent = true})
        vim.api.nvim_buf_set_keymap(0, 'n', '<F5>', ':update<CR>:!flake8 %<CR>', {noremap = true, silent = true})
        vim.api.nvim_buf_set_keymap(0, 'n', '<F6>', ':update<CR>:!mypy %<CR>', {noremap = true, silent = true})
    end
})

vim.api.nvim_create_autocmd("BufRead", {
    pattern = "*.py",
    callback = function()
        if vim.fn.executable("python3") == 1 then
            vim.bo.makeprg = "python3 %"
        elseif vim.fn.executable("python") == 1 then
            vim.bo.makeprg = "python %"
        end
    end
})
