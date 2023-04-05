vim.opt.termguicolors = true
vim.opt.background = 'dark'

vim.cmd("colorscheme ayu")
vim.cmd [[
  hi Normal guibg=NONE ctermbg=NONE
  hi LineNr guibg=NONE ctermbg=Black ctermfg=Green
]]
  -- hi! link CursorLineNr LineNr
  -- hi StatusLine cterm=NONE ctermbg=Black ctermfg=Blue
  -- hi StatusLineNC cterm=NONE ctermbg=Black ctermfg=Green

  -- hi SpellBad cterm=undercurl ctermfg=Red guisp=#dc322f
  -- hi SpellCap cterm=undercurl ctermfg=Red guisp=#dc322f

  -- " Deemphasize tab indicators ('list).
  -- hi SpecialKey cterm=NONE ctermfg=0 ctermbg=NONE
  -- hi SignColumn guibg=NONE ctermbg=NONE
  -- hi EndOfBuffer guibg=NONE ctermbg=NONE
