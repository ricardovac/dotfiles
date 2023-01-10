local map = vim.keymap.set

-- prevent gutter flicker on error
vim.opt.signcolumn = "yes"

-- LSP mappings, also see telescope.lua
-- map("n", "<leader>h", "<cmd>lua vim.lsp.buf.Hover()<CR>")
-- map("n", "<leader>cl", [[<cmd>lua vim.lsp.codelens.run()<CR>]])
-- map("n", "<leader>sh", [[<cmd>lua vim.lsp.buf.signature_help()<CR>]])
map("n", "<leader>ca", vim.lsp.buf.code_action)
-- map("n", "<space>q", vim.diagnostic.setqflist)
map("n", "<leader>rn", vim.lsp.buf.rename)
map("n", "K", vim.lsp.buf.hover)

-- map("n", "<C-s>", "<cmd>lua vim.lsp.buf.format()<CR>")
vim.keymap.set('n', '<C-s>', function() vim.lsp.buf.format { async = true } vim.cmd.w {} end)
map("n", "[c", vim.diagnostic.goto_prev)
map("n", "]c", vim.diagnostic.goto_next)

local lsp_format = require("lsp-format")
lsp_format.setup {}

local on_attach = function(client, bufnr)
  lsp_format.on_attach(client, bufnr)
end

-- Add additional capabilities supported by nvim-cmp
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)

local lspconfig = require('lspconfig')

-- Enable some language servers with the additional completion capabilities offered by nvim-cmp
local servers = { 'rust_analyzer', 'cssls', 'tsserver' }
for _, server in ipairs(servers) do
  lspconfig[server].setup {
    on_attach = on_attach,
    capabilities = capabilities,
  }
end

-- lspconfig.tsserver.setup {
--   on_attach = function(client, _)
--     -- we want null-ls/prettier to handle formatting
--     client.server_capabilities.documentFormattingProvider = false
--   end,
--   capabilities = capabilities
-- }

lspconfig.sumneko_lua.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  settings = {
    Lua = { diagnostics = { globals = { 'vim' }, }, },
    telemetry = { enable = false, },
  }
}

-- local null_ls = require("null-ls")
-- null_ls.setup({
--   sources = {
--     null_ls.builtins.formatting.prettierd.with({
--       filetypes = { "typescript", "scss", "css", "javascript" },
--     }),
--     -- null_ls.builtins.diagnostics.eslint,
--   },
--   on_attach = on_attach, -- async format typescript on save with prettierd
-- })
