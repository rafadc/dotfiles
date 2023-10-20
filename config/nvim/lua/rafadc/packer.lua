return require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'
  use { "catppuccin/nvim", as = "catppuccin" }

  -- Navigation
  use {
    'nvim-telescope/telescope.nvim', 
    requires = { {'nvim-lua/plenary.nvim'} }
  }

  -- Programming language support

  -- If it is a fresh install treesitter does not install. Try with this instead
  -- use {
  --      'nvim-treesitter/nvim-treesitter',
  --      run = function() require('nvim-treesitter.install').update({ with_sync = true }) end,
  --}

  use {
    "folke/which-key.nvim",
    config = function()
      vim.o.timeout = true
      vim.o.timeoutlen = 300
    end
  }

  use {
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate'
  }

  use 'hrsh7th/cmp-nvim-lsp'
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/cmp-path'
  use 'hrsh7th/cmp-cmdline'
  use 'hrsh7th/nvim-cmp'
  use 'neovim/nvim-lspconfig'
  use 'mfussenegger/nvim-dap'

  use 'hrsh7th/cmp-vsnip'
  use 'hrsh7th/vim-vsnip'
  
  use 'aspeddro/gitui.nvim'

  -- Go
  use 'ray-x/go.nvim'

  -- Haskell
  use {
    'MrcJkb/haskell-tools.nvim',
    requires = {
      'nvim-lua/plenary.nvim',
    },
    version = '^2', 
    ft = { 'haskell', 'lhaskell', 'cabal', 'cabalproject' },
  }

  -- Learning Vim
  use 'ThePrimeagen/vim-be-good'


end)


