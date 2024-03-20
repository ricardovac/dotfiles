return {
  {
    'folke/trouble.nvim',
      keys = {
      { "<space>d", "<cmd>TroubleToggle<cr>", desc = "Trouble toggle" },
      { "<space>D", "<cmd>Trouble<cr>", desc = "Trouble open" },
      {
        "<space><space>",
        function()
          local trouble = require("trouble")
          if not trouble.is_open() then
            trouble.open()
          end
          trouble.previous({ skip_groups = true, jump = false })
          trouble.next({ skip_groups = true, jump = true })
        end,
        desc = "First trouble item",
      },
      {
        "]q",
        function()
          if require("trouble").is_open() then
            require("trouble").next({ skip_groups = true, jump = true })
          else
            vim.cmd.cnext()
          end
        end,
        desc = "Next trouble/quickfix item",
      },
    },
    opts = {
      use_diagnostic_signs = true,
      auto_open = false,
      auto_close = true,
    },
  }
}
