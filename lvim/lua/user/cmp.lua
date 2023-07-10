lvim.builtin.cmp.window = {
  completion = {
    -- border = "rounded",
    -- winhighlight = "Normal:Pmenu,CursorLine:PmenuSel,FloatBorder:FloatBorder,Search:None",
    col_offset = -3,
    side_padding = 1,
    scrollbar = true,
    -- scrollbar = {
    --   position = 'inside',
    -- },
    scrolloff = 8,
  },
  documentation = {
    -- border = "rounded",
    -- winhighlight = "Normal:Pmenu,FloatBorder:FloatBorder,Search:None",
  },
}
-- vim.opt.pumblend = 10

lvim.builtin.cmp.formatting.source_names = {
  snippet = "[Snippet]",
  nvim_lsp = "[LSP]",
  treesitter = "[TS]",
  buffer = "[BUF]",
  path = "[PATH]",
  calc = "[CALC]",
  spell = "[SPELL]",
  emoji = "[EMOJI]",
  nvim_lua = "[NVIM_LUA]",
  latex_symbols = "[TEX]",
  latex = "[TEX]",
}


lvim.builtin.cmp.sources[2].entry_filter = function(entry, ctx)
  local kind = require("cmp.types.lsp").CompletionItemKind[entry:get_kind()]
  if kind == "Snippet" and ctx.prev_context.filetype == "java" then
    return false
  end

  if kind == "Text" and not ctx.prev_context.filetype == "markdown" then
    return false
  end

  return true
end
