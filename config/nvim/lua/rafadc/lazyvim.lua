local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
  { "catppuccin/nvim", as = "catppuccin" },

  -- Navigation
  {
    'nvim-telescope/telescope.nvim', 
    dependencies = { {'nvim-lua/plenary.nvim'} }
  },

  {
    "folke/which-key.nvim",
    config = function()
      vim.o.timeout = true
      vim.o.timeoutlen = 300
    end
  },

  {
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate'
  },
  
  { 'p00f/nvim-ts-rainbow', requires = { 'nvim-treesitter/nvim-treesitter' }},
  
  { 'hrsh7th/cmp-nvim-lsp' },
  { 'hrsh7th/cmp-buffer' },
  { 'hrsh7th/cmp-path' },
  { 'hrsh7th/cmp-cmdline' },
  { 'hrsh7th/nvim-cmp' },
  { 'neovim/nvim-lspconfig' },
  { 'mfussenegger/nvim-dap' },

  { 'hrsh7th/cmp-vsnip' },
  { 'hrsh7th/vim-vsnip' },
  
  { 'aspeddro/gitui.nvim' },

  -- Go
  { 'ray-x/go.nvim' },

  -- Haskell
  {
    'MrcJkb/haskell-tools.nvim',
    dependencies = {
      'nvim-lua/plenary.nvim',
    },
  },

  -- Learning Vim
  { 'ThePrimeagen/vim-be-good' },
})



