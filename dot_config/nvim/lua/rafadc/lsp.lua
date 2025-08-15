require('mason').setup({})
require("mason-lspconfig").setup {
    ensure_installed = { "rust_analyzer", "tsserver", "pyright", "gopls", "sumneko_lua", "solargraph", "sqls", "unocss", "tailwindcss" },
}

local lsp_zero = require('lsp-zero')

lsp_zero.on_attach(function(client, bufnr)
  -- see :help lsp-zero-keybindings
  -- to learn the available actions
  lsp_zero.default_keymaps({buffer = bufnr})
end)


