require 'startup'

require 'packer'.startup({ function(use)
  use 'wbthomason/packer.nvim'
  use 'nvim-lua/plenary.nvim'
  use 'kyazdani42/nvim-web-devicons'
  use 'neovim/nvim-lspconfig'
  use 'folke/tokyonight.nvim'
  use 'nvim-lualine/lualine.nvim'
  use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }
  use 'nvim-treesitter/nvim-treesitter-context' -- display context (fun, class) at the top
  use 'nvim-telescope/telescope.nvim'
  use { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }
  use 'kdheepak/lazygit.nvim'
  use 'kylechui/nvim-surround'
  use 'tpope/vim-commentary'
  use 'danro/rename.vim'
  use 'mattn/vim-gist'
  use 'wellle/targets.vim' -- adds various text objects - vimscript
  use 'jremmen/vim-ripgrep'
  use 'stefandtw/quickfix-reflector.vim'
  use 'rust-lang/rust.vim'
  use 'onsails/lspkind-nvim' -- lsp icons
  use {
    "windwp/nvim-autopairs",
    config = function() require("nvim-autopairs").setup {} end
  }
  use({
    "hrsh7th/nvim-cmp",
    requires = { "hrsh7th/cmp-nvim-lsp", "hrsh7th/cmp-buffer", "hrsh7th/cmp-path",
      "petertriho/cmp-git", "ray-x/cmp-treesitter", 'L3MON4D3/LuaSnip', 'saadparwaiz1/cmp_luasnip' },
  })
  use 'scalameta/nvim-metals'
  use 'mfussenegger/nvim-dap' -- debugger
  use 'lukas-reineke/lsp-format.nvim' -- async code formatting
  -- use 'jose-elias-alvarez/null-ls.nvim' -- hook into nvim LSP
  use 'petertriho/nvim-scrollbar'
  use 'lewis6991/gitsigns.nvim'
  use 'ruanyl/vim-gh-line' -- git browse (<leader>gh)
  -- use 'kevinhwang91/nvim-hlslens'
  --use 'rcarriga/nvim-notify'
  -- use 'RRethy/vim-illuminate'
  use 'zakharykaplan/nvim-retrail' -- trim trail whitespace
  use 'tjdevries/colorbuddy.vim'
  use 'tjdevries/gruvbuddy.nvim'
  use 'norcalli/nvim-colorizer.lua'

  -- use 'gbprod/yanky.nvim' -- yank ring
  use { "williamboman/mason.nvim",
    require("mason").setup()
  }
  use 'mizlan/iswap.nvim' -- swap arguments and things
  use({ "nvim-tree/nvim-tree.lua", opt = true, cmd = { "NvimTreeToggle" },
    setup = function() vim.keymap.set('n', '-', ':NvimTreeToggle<cr>') end,
    config = function() require("plugins.tree") end,
  })
end,
  config = { autoremove = true }
})

--require('theme')
require('settings')
--require('colemak')
require('mappings')
require('commands')
require('functions')
require('project')
require('lsp')

require("colorbuddy").colorscheme "gruvbuddy"
require("colorizer").setup()

require('plugins.lualine')
require('plugins.cmp')
require('plugins.metals')
require('plugins.treesitter')
require('plugins.telescope')
require('plugins.scrollbar')
require('plugins.unimpaired')
require('plugins.others')
