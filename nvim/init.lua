require 'startup'

require 'packer'.startup({ function(use)
  use 'wbthomason/packer.nvim'
  use 'nvim-lua/plenary.nvim'
  use 'neovim/nvim-lspconfig'
  use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }
  use 'nvim-treesitter/nvim-treesitter-context' -- display context (fun, class) at the top
  use 'nvim-telescope/telescope.nvim'
  use { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }
  use { 'nvim-telescope/telescope-ui-select.nvim' }
  use 'kdheepak/lazygit.nvim'
  use 'kylechui/nvim-surround'
  use 'tpope/vim-commentary'
  use 'danro/rename.vim'

  -- Barbecure
  use 'SmiteshP/nvim-navic'
  use({
  "utilyre/barbecue.nvim",
  tag = "*",
  requires = {
    "neovim/nvim-lspconfig",
    "SmiteshP/nvim-navic",
    "nvim-tree/nvim-web-devicons", -- optional dependency
  },
    after = "nvim-web-devicons", -- keep this if you're using NvChad
    config = function()
      require("barbecue").setup()
    end,
  })

  -- Theme
  use 'lunarvim/darkplus.nvim'

  use 'simrat39/inlay-hints.nvim'
  use "lukas-reineke/indent-blankline.nvim"
  use 'nvim-lualine/lualine.nvim'
  use 'kyazdani42/nvim-web-devicons'
  use 'L3MON4D3/LuaSnip'
  use 'jiangmiao/auto-pairs'
  use 'wellle/targets.vim' -- adds various text objects - vimscript
  use 'jremmen/vim-ripgrep'
  use 'rust-lang/rust.vim'
  use 'onsails/lspkind-nvim' -- lsp icons
  use { "williamboman/mason.nvim"}
  use({
    "hrsh7th/nvim-cmp",
    requires = { "hrsh7th/cmp-nvim-lsp", "hrsh7th/cmp-buffer", "hrsh7th/cmp-path",
      "petertriho/cmp-git", "ray-x/cmp-treesitter" },
  })

  -- Debugging golang
  use 'mfussenegger/nvim-dap' 
  use 'leoluz/nvim-dap-go'
  use 'rcarriga/nvim-dap-ui'
  use 'theHamsta/nvim-dap-virtual-text'
  use 'nvim-telescope/telescope-dap.nvim'

  use({
    "andrewferrier/wrapping.nvim",
    config = function()
        require("wrapping").setup()
        vim.cmd('SoftWrapMode')
    end,
  })
  use 'lukas-reineke/lsp-format.nvim' -- async code formatting
  use 'jose-elias-alvarez/null-ls.nvim' -- hook into nvim LSP
  use 'lewis6991/gitsigns.nvim'
  use 'petertriho/nvim-scrollbar'
  use 'psliwka/vim-smoothie'

  use 'kevinhwang91/nvim-hlslens'
  use 'zakharykaplan/nvim-retrail' -- trim trail whitespace
  use({ "nvim-tree/nvim-tree.lua", opt = true, cmd = { "NvimTreeToggle" },
    setup = function() vim.keymap.set('n', '-', ':NvimTreeToggle<cr>') end,
    config = function() require("plugins.tree") end,
  })
end,
  config = { autoremove = true }
})

require("mason").setup()

require('theme')
require('settings')
require('mappings')
require('commands')
require('functions')
require('project')
require('lsp')

require('plugins.lualine')
require('plugins.cmp')
require('plugins.indentline')
require('plugins.inlay-hints')
require('plugins.treesitter')
require('plugins.telescope')
require('plugins.unimpaired')
require('plugins.others')
require('plugins.scrollbar')
require('plugins.smoothie')
-- require('plugins.dap')
require('plugins.dap-go')
