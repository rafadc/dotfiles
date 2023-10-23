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

  { 'mbbill/undotree' },

  {
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate'
  },
  
  { 'p00f/nvim-ts-rainbow', requires = { 'nvim-treesitter/nvim-treesitter' }},
  { 'chentoast/marks.nvim' },

  {'VonHeikemen/lsp-zero.nvim', branch = 'v3.x'},
  {'neovim/nvim-lspconfig'},
  {'hrsh7th/cmp-nvim-lsp'},
  {'hrsh7th/nvim-cmp'},
  {'L3MON4D3/LuaSnip'}, 

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


