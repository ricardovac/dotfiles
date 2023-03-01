require("nvim-tree").setup({
  disable_netrw = true,
  hijack_netrw = true,
  ignore_ft_on_setup = {'dashboard'},
  open_on_tab = false,
  update_cwd = true,
  actions = {
    open_file = {
      resize_window = true,
    }
  },
  sort_by = "name",
  update_focused_file = {
    enable = true,
  },
  view = {
    width = 25,
    adaptive_size = true,
    hide_root_folder = false,
    side = 'left',
  },
  renderer = {
    group_empty = true,
    indent_markers = {
      enable = true,
      icons = {
        -- corner = "└ ",
        -- edge = "│ ",
        -- item = "│  ",
        corner = " ",
        edge = " ",
        item = "  ",
        none = "  ",
      },
    },
  },
  filters = {
    dotfiles = false,
  },
  diagnostics = {
    enable = true,
    show_on_dirs = false,
    icons = {
      hint = "",
      info = "",
      warning = "",
      error = "",
    },
  }
})
