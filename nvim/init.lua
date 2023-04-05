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

  use 'simrat39/inlay-hints.nvim'
  use 'nvim-lualine/lualine.nvim'
  use 'norcalli/nvim-colorizer.lua'
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
  -- use 'mfussenegger/nvim-dap' 
  -- use 'leoluz/nvim-dap-go'
  -- use 'mfussenegger/nvim-jdtls'
  -- use 'rcarriga/nvim-dap-ui'
  -- use 'theHamsta/nvim-dap-virtual-text'
  -- use 'nvim-telescope/telescope-dap.nvim'

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
  use 'tjdevries/colorbuddy.nvim'
  use 'tjdevries/gruvbuddy.nvim'

  -- use 'kevinhwang91/nvim-hlslens'
  use 'zakharykaplan/nvim-retrail' -- trim trail whitespace
  use({ "nvim-tree/nvim-tree.lua", opt = true, cmd = { "NvimTreeToggle" },
    setup = function() vim.keymap.set('n', '-', ':NvimTreeToggle<cr>') end,
    config = function() require("plugins.tree") end,
  })
end,
  config = { autoremove = true }
})

require("mason").setup()

require('settings')
require('mappings')
require('commands')
require('functions')
require('project')
require('lsp')

-- require('plugins.lualine')
require('plugins.cmp')
require('plugins.colorscheme')
-- require('plugins.indentline')
require('plugins.inlay-hints')
require('plugins.treesitter')
require('plugins.telescope')
require('plugins.unimpaired')

require('plugins.others')
-- require('plugins.scrollbar')
-- require('plugins.smoothie')
-- require('plugins.dap')
-- require('plugins.dap-go')
