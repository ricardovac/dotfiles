return {
  {
    "echasnovski/mini.hipatterns",
    event = { "BufReadPre" },
    opts = {},
  },
  -- {
  --   "echasnovski/mini.indentscope",
  --   event = { "BufReadPre", "BufNewFile" },
  --   opts = {
  --     symbol = "│",
  --     options = { try_as_border = true },
  --   },
  --   init = function()
  --     vim.api.nvim_create_autocmd("FileType", {
  --       pattern = {
  --         "help",
  --         "alpha",
  --         "dashboard",
  --         "neo-tree",
  --         "Trouble",
  --         "lazy",
  --         "mason",
  --         "notify",
  --         "toggleterm",
  --         "lazyterm",
  --       },
  --       callback = function()
  --         vim.b.miniindentscope_disable = true
  --       end,
  --     })
  --   end,
  -- },
}
