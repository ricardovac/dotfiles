require('lualine').setup {
  options = {
    theme = 'onedark'
  },
  sections = {
    lualine_b = { 'filename' },
    lualine_c = { 'branch', 'diff' },
    lualine_x = {},
    lualine_y = { 'diagnostics' },
  },
  icons_enabled = false,
  -- sections = {
  --   lualine_a = { { 'mode' } },
  --   -- lualine_a = { { 'mode', fmt = function(str) return str:sub(1, 1) end } },
  --   lualine_b = { 'b:gitsigns_head', 'diff',
  --     { 'diagnostics', sources = { 'nvim_diagnostic', 'nvim_lsp' } }
  --   },
  --   lualine_c = {
  --     { 'filename', path = 3 },
  --     -- 'buffers'
  --   },
  --   lualine_x = { 'g:metals_status' },
  --   lualine_y = {},
  --   lualine_z = { 'location' }
  -- }
}
