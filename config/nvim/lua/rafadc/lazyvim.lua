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
  { "shatur/neovim-ayu", as = "ayu" },

  -- UI
  { 'ray-x/guihua.lua', run = 'cd lua/fzy && make'},
  { 'theHamsta/nvim-dap-virtual-text' },

  { 'goolord/alpha-nvim' },
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
    'ThePrimeagen/harpoon',
     dependencies = {
       'nvim-lua/plenary.nvim',
     },
  },

  {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
      "MunifTanjim/nui.nvim",
      "3rd/image.nvim", -- Optional image support in preview window: See `# Preview Mode` for more information
    }
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
  {'hrsh7th/cmp-buffer'},
  {'hrsh7th/cmp-path'},
  {'hrsh7th/cmp-cmdline'},

  {
   "folke/trouble.nvim",
   dependencies = { "nvim-tree/nvim-web-devicons" },
   opts = {},
  },

  { "folke/neodev.nvim", opts = {} },

  {
    "epwalsh/obsidian.nvim",
    version = "*",  -- recommended, use latest release instead of latest commit
    lazy = true,
    ft = "markdown",
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
  },

  -- Git
  { 'aspeddro/gitui.nvim' },

  -- Copilot
  { 'github/copilot.vim' },

  -- Debugging
  { "mfussenegger/nvim-dap" },
  { "rcarriga/nvim-dap-ui", requires = {"mfussenegger/nvim-dap"} },

  -- Go
  { 'ray-x/go.nvim' },
  { 'leoluz/nvim-dap-go' },

  -- Haskell
  {
    'MrcJkb/haskell-tools.nvim',
    dependencies = {
      'nvim-lua/plenary.nvim',
    },
  },
  { 'sdiehl/vim-ormolu' },

  -- Plant UML
  {
    'javiorfo/nvim-soil',
    lazy = true,
    ft = "plantuml",
    config = function()
        -- If you want to change default configurations
    end
  },

  { 'javiorfo/nvim-nyctophilia' }
})



