lvim.builtin.telescope.extensions.fzf = {
  fuzzy = true,
  override_generic_sorter = true, -- override the generic sorter
  override_file_sorter = true,    -- override the file sorter
  case_mode = "smart_case",       -- or "ignore_case" or "respect_case"
}

lvim.builtin.telescope = {
  defaults = {
    layout_strategy = "horizontal",
  },
}

lvim.builtin.telescope.pickers = {
  find_files = {
    layout_config = {
      width = 0.95,
    },
  },
  live_grep = {
    layout_config = {
      width = 0.95,
    },
  },
}
