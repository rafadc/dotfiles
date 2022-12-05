require('go').setup()

vim.api.nvim_create_autocmd( "BufWritePre", {
  command = "silent! lua require('go.format').gofmt()",
  pattern = "*.go"
})

require('lspconfig')['gopls'].setup {
    capabilities = capabilities
}
