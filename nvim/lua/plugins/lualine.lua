require('lualine').setup {
  options = {
    globalstatus = true,
    theme = 'auto',
    component_separators = { left = '', right = ''},
    section_separators = { left = '', right = ''},
    disabled_filetypes = { "alpha", "dashboard" },
    always_divide_middle = true,
  },
  sections = {
    lualine_b = { 'filename' },
    lualine_c = { 'branch', 'diff' },
    lualine_x = {},
    lualine_y = { 'diagnostics' },
  },
  icons_enabled = true,
  sections = {
    lualine_a = { { 'mode' } },
    -- lualine_a = { { 'mode', fmt = function(str) return str:sub(1, 1) end } },
    lualine_b = { 'b:gitsigns_head', 'diff',
      { 'diagnostics', sources = { 'nvim_diagnostic', 'nvim_lsp' } }
    },
    lualine_c = {
      -- { 'filename', path = 3 },
      { 'filename'},
      -- 'buffers'
    },
    lualine_x = {'encoding', 'fileformat', 'filetype'},
    lualine_y = {},
    lualine_z = { 'location' }
  }
}
