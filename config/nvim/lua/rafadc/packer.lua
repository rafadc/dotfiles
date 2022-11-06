-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'
  use 'Shatur/neovim-ayu'

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

  use 'ThePrimeagen/vim-be-good'
end)


