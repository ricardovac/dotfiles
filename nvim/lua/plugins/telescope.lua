local map = vim.keymap.set
local builtin = require('telescope.builtin')
require("telescope").load_extension("ui-select")

map('n', '<leader>mf', builtin.find_files, {})
map('n', '<leader>md', builtin.oldfiles, {})
map('n', '<leader>mr', function() builtin.find_files({ cwd = vim.fn.expand('%:p:h') }) end, {})
map('n', '<leader>a', builtin.live_grep, {})
map('n', '<leader>pf', builtin.buffers, {})
map('n', '<leader>H', builtin.help_tags, {})
map('n', '<leader>za', builtin.grep_string, {})
map('n', '<leader>co', builtin.colorscheme, {})
map('n', 'Q', builtin.commands, {})
map('n', 'qq', builtin.command_history, {})
map('n', 'q/', builtin.search_history, {})
map('n', '<leader>man', builtin.man_pages, {})
map('n', '<leader>qf', builtin.quickfix, {})
map('n', '<leader>qh', builtin.quickfixhistory, {})
-- map('n', '<leader>vo', builtin.vim_options, {})
map('n', '<leader>f', builtin.current_buffer_fuzzy_find, {})

-- lsp
map("n", "gd", builtin.lsp_definitions)
map("n", "gr", builtin.lsp_references)
map("n", "gi", builtin.lsp_implementations)
-- map("n", "<space>o", builtin.lsp_document_symbols)
-- map("n", "<space>s", builtin.lsp_dynamic_workspace_symbols)
map("n", "<C-e>", builtin.diagnostics)

local tel = require 'telescope'
tel.setup {
  defaults = {
    prompt_prefix = "   ",
    selection_caret = "  ",
    entry_prefix = "  ",
    initial_mode = "insert",
    selection_strategy = "reset",
    sorting_strategy = "ascending",
    layout_strategy = "vertical",
    -- Default configuration for telescope goes here:
    -- config_key = value,
    file_ignore_patterns = { 
      "node_modules",
      "target"
    },
    mappings = {
      i = {
        ["<C-e>"] = "move_selection_previous",
        ["<esc>"] = "close",
        -- ['<C-p>'] = require('telescope.actions.layout').toggle_preview,
      }
    },
    scroll_strategy = 'limit',
    layout_config = {
      horizontal = {
        height = 0.80,
        preview_cutoff = 120,
        prompt_position = "top",
        width = 0.87
      }
    },
    vertical = {
      mirror = false,
    },
    dynamic_preview_title = true
  },
  pickers = {
  },
  extensions = {
    fzf = {
      fuzzy = true, -- false will only do exact matching
      override_generic_sorter = true, -- override the generic sorter
      override_file_sorter = true, -- override the file sorter
      case_mode = "smart_case", -- or "ignore_case" or "respect_case"
      -- the default case_mode is "smart_case"
    },
    ["ui-select"] = {
      require("telescope.themes").get_dropdown {
        -- even more opts
      }
    }
  },
  winblend = 0,
  border = {},
  borderchars = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" },
  color_devicons = true,
}
tel.load_extension 'fzf'

