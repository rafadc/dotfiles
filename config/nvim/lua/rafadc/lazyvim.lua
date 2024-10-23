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
  -- Mason for dependencies
  {
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    "neovim/nvim-lspconfig",
  },

  -- UI
  { 'ray-x/guihua.lua', build = 'cd lua/fzy && make'},
  { 'theHamsta/nvim-dap-virtual-text' },

  { 'goolord/alpha-nvim' },
  -- Navigation
  {
    'nvim-telescope/telescope.nvim',
    dependencies = {
      {'nvim-lua/plenary.nvim'},
      {'noib3/nvim-oxi'}
    }
  },
  {
    'nvim-pack/nvim-spectre',
    dependencies = { {'nvim-lua/plenary.nvim'} }
  },
  {
    "danielfalk/smart-open.nvim",
    config = function()
      require("telescope").load_extension("smart_open")
    end,
    dependencies = {
      "kkharji/sqlite.lua",
      { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
      { "nvim-telescope/telescope-fzy-native.nvim" },
    },
  },
  {
    "folke/which-key.nvim",
    config = function()
      vim.o.timeout = true
      vim.o.timeoutlen = 300
    end
  },
  {
    "otavioschwanck/arrow.nvim",
    dependencies = {
      { "nvim-tree/nvim-web-devicons" },
    },
    opts = {
      show_icons = true,
      leader_key = ';', -- Recommended to be a single key
      buffer_leader_key = 'm', -- Per Buffer Mappings
    }
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
    build = ':TSUpdate'
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
  { "nvim-neotest/nvim-nio" },
  { "rcarriga/nvim-dap-ui",
    requires =
    {
      "mfussenegger/nvim-dap",
      "nvim-neotest/nvim-nio"
    }
  },


  -- Comment
  {
    'numToStr/Comment.nvim',
    opts = {
        -- add any options here
    },
    lazy = false,
  },

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


  -- AI Assistant
  {
    "yetone/avante.nvim",
    event = "VeryLazy",
    opts = {},
    build = "make",
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
      "stevearc/dressing.nvim",
      "nvim-lua/plenary.nvim",
      "MunifTanjim/nui.nvim",
      --- The below dependencies are optional,
      "nvim-tree/nvim-web-devicons", -- or echasnovski/mini.icons
      "zbirenbaum/copilot.lua", -- for providers='copilot'
      {
        -- support for image pasting
        "HakonHarnes/img-clip.nvim",
        event = "VeryLazy",
        opts = {
          -- recommended settings
          default = {
            embed_image_as_base64 = false,
            prompt_for_file_name = false,
            drag_and_drop = {
              insert_mode = true,
            },
            -- required for Windows users
            use_absolute_path = true,
          },
        },
      },
      {
        -- Make sure to set this up properly if you have lazy=true
        'MeanderingProgrammer/render-markdown.nvim',
        opts = {
          file_types = { "markdown", "Avante" },
        },
        ft = { "markdown", "Avante" },
      },
    },
  }
})



