require 'startup'

require 'packer'.startup({ function(use)
  use 'wbthomason/packer.nvim'
  use 'nvim-lua/plenary.nvim'
  use 'neovim/nvim-lspconfig'
  use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }
  use 'nvim-treesitter/nvim-treesitter-context' -- display context (fun, class) at the top
  use 'nvim-telescope/telescope.nvim'
  use { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }
  use 'kdheepak/lazygit.nvim'
  use 'kylechui/nvim-surround'
  use 'tpope/vim-commentary'
  use 'danro/rename.vim'
  -- use 'tjdevries/cyclist.vim'

  -- Theme
  use 'jordwalke/vim-taste'
  -- use 'tjdevries/colorbuddy.vim'
  -- use 'tjdevries/gruvbuddy.nvim'
  use 'norcalli/nvim-colorizer.lua'
  -- use 'Yggdroot/indentLine'
  use 'nvim-lualine/lualine.nvim'
  use 'kyazdani42/nvim-web-devicons'
  -- use ({ 
  --   "ellisonleao/gruvbox.nvim",
  --   config = function() 
  --       require("gruvbox").setup()
  --       vim.cmd('colorscheme gruvbox')
  --   end
  -- })


  use({
    "navarasu/onedark.nvim",
    config = function()
        require("onedark").setup {
            style = "darker",
            colors = {
                grey = "#878787", -- define a new color
                green = "#00ffaa", -- redefine an existing color
            },
            highlights = {
                Visual = { bg = "#4a4a4a" },
            },
        }
        require("onedark").load()
    end
  })


  use 'L3MON4D3/LuaSnip'
  use 'jiangmiao/auto-pairs'
  use 'wellle/targets.vim' -- adds various text objects - vimscript
  use 'jremmen/vim-ripgrep'
  use 'stefandtw/quickfix-reflector.vim'
  use 'rust-lang/rust.vim'
  use 'onsails/lspkind-nvim' -- lsp icons
  use { "williamboman/mason.nvim" }
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

  -- Debugging / Java
  -- use 'mfussenegger/nvim-dap'
  -- use 'rcarriga/cmp-dap'
  -- use { "mfussenegger/nvim-jdtls", ft = { "java" }}
  -- use { "rcarriga/nvim-dap-ui", requires = {"mfussenegger/nvim-dap"} }
  --
  use({
    "andrewferrier/wrapping.nvim",
    config = function()
        require("wrapping").setup()
    end,
  })
  use 'lukas-reineke/lsp-format.nvim' -- async code formatting
  use 'jose-elias-alvarez/null-ls.nvim' -- hook into nvim LSP
  use 'lewis6991/gitsigns.nvim'
  use 'ruanyl/vim-gh-line' -- git browse (<leader>gh)
  use 'kevinhwang91/nvim-hlslens'
  use 'zakharykaplan/nvim-retrail' -- trim trail whitespace
  use 'gbprod/yanky.nvim' -- yank ring
  use({ "nvim-tree/nvim-tree.lua", opt = true, cmd = { "NvimTreeToggle" },
    setup = function() vim.keymap.set('n', '-', ':NvimTreeToggle<cr>') end,
    config = function() require("plugins.tree") end,
  })
  use({ "eandrju/cellular-automaton.nvim", opt = true, cmd = { "CellularAutomaton" } })
  -- use 'dstein64/vim-startuptime'
end,
  config = { autoremove = true }
})

require("mason").setup()

-- require('theme')
require('settings')
-- require('colemak')
require('mappings')
require('commands')
require('functions')
require('project')
require('lsp')

-- require("colorbuddy").colorscheme "gruvbuddy"
-- require("colorizer").setup()

require('plugins.lualine')
require('plugins.cmp')
require('plugins.treesitter')
require('plugins.telescope')
require('plugins.unimpaired')
require('plugins.others')
-- require('plugins.dap')
require('plugins.dap-go')
