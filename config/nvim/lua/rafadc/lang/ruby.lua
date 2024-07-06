require('lspconfig').solargraph.setup{}

require('lspconfig')['ruby_lsp'].setup {
    capabilities = capabilities
}

vim.api.nvim_create_autocmd("FileType", {
  pattern = "ruby",
  callback = function()
    vim.api.nvim_buf_set_keymap(0, 'n', '<F4>', ':update<CR>:!bundle exec rubocop -A %<CR>', {noremap = true, silent = true})
  end
})

