-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'
  use 'Shatur/neovim-ayu'

  -- Navigation
  use {
    'nvim-telescope/telescope.nvim', tag = '0.1.0',
    requires = { {'nvim-lua/plenary.nvim'} }
  }

  -- Programming language support

  -- If it is a fresh install treesitter does not install. Try with this instead
  --  use {
  --      'nvim-treesitter/nvim-treesitter',
  --      run = function() require('nvim-treesitter.install').update({ with_sync = true }) end,
  --  }

  use {
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate'
  }
  use 'ray-x/go.nvim'

  -- Haskell
  use {
    'MrcJkb/haskell-tools.nvim',
    requires = {
      'neovim/nvim-lspconfig',
      'nvim-lua/plenary.nvim',
      'nvim-telescope/telescope.nvim', -- optional
    },
    -- tag = 'x.y.z' -- [^1]
  }

  -- Learning Vim
  use 'ThePrimeagen/vim-be-good'


end)


