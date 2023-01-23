vim.opt.completeopt = { "menu", "menuone", "noselect" }

local cmp = require 'cmp'
local cmp_buffer = require 'cmp_buffer'
local lspkind = require('lspkind')
local luasnip = require 'luasnip'

local get_bufnrs_unless_huge = function()
  local buf = vim.api.nvim_get_current_buf()
  if vim.api.nvim_buf_get_offset(buf, vim.api.nvim_buf_line_count(buf)) > 1024 * 1024 then -- 1 Megabyte max
    return {}
  end
  return { buf }
end

-- nvim-cmp supports additional completion capabilities, so broadcast that to servers
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)

cmp.setup {
  -- view = {
  --   entries = "custom" -- can be "custom", "wildmenu" or "native"
  -- },
  sources = {
    { name = "nvim_lsp" },
    { name = "luasnip" },
    { name = "treesitter" },
    { name = "path" },
    { name = 'buffer', option = {
      keyword_length = 4,
      option = {
        get_bufnrs = get_bufnrs_unless_huge
      }
    } },
    { name = "spell" },
    -- { name = "treesitter" },
    -- { name = "path" },
  },
  sorting = {
    comparators = {
      cmp.config.compare.offset,
      cmp.config.compare.exact,
      cmp.config.compare.score,

      -- copied from cmp-under, but I don't think I need the plugin for this.
      -- I might add some more of my own.
      function(entry1, entry2)
        local _, entry1_under = entry1.completion_item.label:find "^_+"
        local _, entry2_under = entry2.completion_item.label:find "^_+"
        entry1_under = entry1_under or 0
        entry2_under = entry2_under or 0
        if entry1_under > entry2_under then
          return false
        elseif entry1_under < entry2_under then
          return true
        end
      end,

      cmp.config.compare.kind,
      cmp.config.compare.sort_text,
      cmp.config.compare.length,
      cmp.config.compare.order,
    },
  },

  mapping = {
    ["<C-n>"] = cmp.mapping.select_next_item { behavior = cmp.SelectBehavior.Insert },
    ["<C-p>"] = cmp.mapping.select_prev_item { behavior = cmp.SelectBehavior.Insert },
    ["<C-d>"] = cmp.mapping.scroll_docs(-4),
    ["<C-f>"] = cmp.mapping.scroll_docs(4),
    ["<C-e>"] = cmp.mapping.abort(),
    ["<CR>"] = cmp.mapping(
      cmp.mapping.confirm {
        behavior = cmp.ConfirmBehavior.Insert,
        select = true,
      },
      { "i", "c" }
    ),
    ["<M-y>"] = cmp.mapping(
      cmp.mapping.confirm {
        behavior = cmp.ConfirmBehavior.Replace,
        select = false,
      },
      { "i", "c" }
    ),

    ["<c-space>"] = cmp.mapping {
      i = cmp.mapping.complete(),
      c = function(
        _ --[[fallback]]
      )
        if cmp.visible() then
          if not cmp.confirm { select = true } then
            return
          end
        else
          cmp.complete()
        end
      end,
    },

    -- ["<tab>"] = false,
    ["<tab>"] = cmp.config.disable,

    -- ["<tab>"] = cmp.mapping {
    --   i = cmp.config.disable,
    --   c = function(fallback)
    --     fallback()
    --   end,
    -- },

    -- Testing
    ["<c-q>"] = cmp.mapping.confirm {
      behavior = cmp.ConfirmBehavior.Replace,
      select = false,
    },
  },

  -- mapping = cmp.mapping.preset.insert({
  -- ["<C-e>"] = cmp.mapping(function(fallback)
  --   if cmp.visible() then
  --     vim.api.nvim_command('write')
  --     cmp.confirm({ behavior = cmp.ConfirmBehavior.Replace, select = false })
  --   else
  --     fallback()
  --   end
  -- end, { 'i', 's' }),
  -- ['<Tab>'] = cmp.mapping(function(fallback)
  --   if cmp.visible() then
  --     cmp.select_next_item()
  --   elseif luasnip.expand_or_jumpable() then
  --     luasnip.expand_or_jump()
  --   else
  --     fallback()
  --   end
  -- end, { 'i', 's' }),
  -- ["<C-e>"] = cmp.mapping.confirm({ behavior = cmp.ConfirmBehavior.Replace, select = false }),
  -- -- ['<CR>'] = cmp.mapping.confirm { behavior = cmp.ConfirmBehavior.Replace, select = false, },
  -- ['<CR>'] = cmp.mapping.confirm {
  --   behavior = cmp.ConfirmBehavior.Replace,
  --   select = true,
  -- },
  -- ['<C-Space>'] = cmp.mapping.complete { behavior = cmp.ConfirmBehavior.Replace, select = true, },
  -- -- ["<C-n>"] = cmp.mapping.select_next_item(),
  -- -- ["<C-k>"] = cmp.mapping.select_prev_item(),
  -- ['<C-n>'] = cmp.mapping(function()
  --   if cmp.visible() then
  --     cmp.select_next_item()
  --   else
  --     -- fallback()
  --   end
  -- end, { 'i', 's' }),
  -- ['<C-k>'] = cmp.mapping(function()
  --   if cmp.visible() then
  --     cmp.select_prev_item()
  --   else
  --     -- fallback()
  --   end
  -- end, { 'i', 's' }),
  -- ['<S-Tab>'] = cmp.mapping(function(fallback)
  --   if cmp.visible() then
  --     cmp.select_prev_item()
  --   elseif luasnip.jumpable(-1) then
  --     luasnip.jump(-1)
  --   else
  --     fallback()
  --   end
  -- end, { 'i', 's' }),
  -- }),
  formatting = {
    format = function(entry, vim_item)
      if vim.tbl_contains({ 'path' }, entry.source.name) then
        local icon, hl_group = require('nvim-web-devicons').get_icon(entry:get_completion_item().label)
        if icon then
          vim_item.kind = { icon }
          vim_item.kind_hl_group = hl_group
          return vim_item
        end
      end
      return lspkind.cmp_format({ with_text = true })(entry, vim_item)
    end
  },
  snippet = {
    expand = function(args)
      require("luasnip").lsp_expand(args.body)
    end,
  },
  experimental = {
    native_menu = false,
    ghost_text = true
  }
}

-- Set configuration for specific filetype.
cmp.setup.filetype('gitcommit', {
  sources = cmp.config.sources({
    { name = 'cmp_git' }, -- You can specify the `cmp_git` source if you were installed it.
    { name = 'buffer' },
  })
})

-- require("cmp").setup({
--   enabled = function()
--     return vim.api.nvim_buf_get_option(0, "buftype") ~= "prompt"
--         or require("cmp_dap").is_dap_buffer()
--   end
-- })

-- require("cmp").setup.filetype({ "dap-repl", "dapui_watches", "dapui_hover" }, {
--   sources = {
--     { name = "dap" },
--   },
-- })

-- nvim-cmp highlight groups.
-- local Group = require("colorbuddy.group").Group
-- local g = require("colorbuddy.group").groups
-- local s = require("colorbuddy.style").styles

-- Group.new("CmpItemAbbr", g.Comment)
-- Group.new("CmpItemAbbrDeprecated", g.Error)
-- Group.new("CmpItemAbbrMatchFuzzy", g.CmpItemAbbr.fg:dark(), nil, s.italic)
-- Group.new("CmpItemKind", g.Special)
-- Group.new("CmpItemMenu", g.NonText)

-- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
-- cmp.setup.cmdline({ '/', '?' }, {
--   mapping = cmp.mapping.preset.cmdline({
--     ["<C-k>"] = cmp.mapping.select_prev_item(),
--     ["<C-n>"] = cmp.mapping.select_next_item(),
--   }),
--   sources = {
--     { name = 'buffer' }
--   }
-- })

-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
-- cmp.setup.cmdline(':', {
--   mapping = cmp.mapping.preset.cmdline({
--     ["<C-k>"] = cmp.mapping.select_prev_item(),
--     ["<C-n>"] = cmp.mapping.select_next_item(),
--   }),
--   sources = cmp.config.sources({
--     { name = 'buffer' },
--     { name = 'path' },
--     { name = 'cmdline' }
--   })
-- })
