require'nvim-treesitter.configs'.setup {
  -- A list of parser names, or "all"
  ensure_installed = { "lua", "rust", "ruby", "haskell", "go" },

  -- Install parsers synchronously (only applied to `ensure_installed`)
  sync_install = false
}
