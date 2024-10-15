-- local illuminate = require("illuminate")
local map = require("utils").map

-- Set space as the global leader
map("n", "<leader>", "<Nop>", { silent = true })

map("i", "jj", "<ESC>", { noremap = true, silent = true, desc = "<ESC>" })

-- File Manager
map("n", "<leader>e", "<cmd>Neotree toggle<cr>")

map("n", "<leader>E", "<cmd>Neotree action=focus<cr>")

-- Save
map("n", "<leader>w", "<cmd>w<cr>", { desc = "Save file" })

map("n", "<leader>q", "<cmd>q<cr>", { desc = "Quit", silent = false })

-- Hide search results
map("n", "<leader>no", "<cmd>noh<cr>", { desc = "Hide search results" })

-- map("n", "<C-m>", "<C-b>")
map("n", "<C-m>", '<cmd>call smoothie#do("<C-B>")<cr>')

-- Illuminate
-- map("n", "<leader>]", function()
-- 	illuminate.goto_next_reference()
-- 	vim.api.nvim_feedkeys("zz", "n", false)
-- end, { desc = "Illuminate: Go to next reference" })

-- map("n", "<leader>[", function()
-- illuminate.goto_prev_reference()
-- 	vim.api.nvim_feedkeys("zz", "n", false)
-- end, { desc = "Illuminate: Go to previous reference" })

-- Buffers
map("n", "<leader>bn", "<cmd>bnext<cr>", { desc = "Go to next buffer" })
map("n", "<leader>l", "<cmd>bnext<cr>", { desc = "Go to next buffer" })
map("n", "<leader>h", "<cmd>bprevious<cr>", { desc = "Go to next buffer" })

-- Refactor
map(
	{ "n", "x" },
	"<leader>ri",
	"<cmd>lua vim.lsp.buf.rename()<cr>",
	{ desc = "Rename pointer under cursor for current buffer" }
)

-- Telescope
map("n", "<leader><leader>", require("telescope.builtin").buffers, { desc = "Go to next buffer" })
map("n", "<leader>f", require("telescope.builtin").find_files, { desc = "Find files in current pwd" })
map("n", "<leader>s", require("telescope.builtin").lsp_document_symbols, { desc = "Find in symbols" })
map("n", "<leader>a", require("telescope.builtin").live_grep, { desc = "Grep find" })

-- Splits
map("n", "<C-h>", require("smart-splits").move_cursor_left)
map("n", "<C-j>", require("smart-splits").move_cursor_down)
map("n", "<C-k>", require("smart-splits").move_cursor_up)
map("n", "<C-l>", require("smart-splits").move_cursor_right)

map("n", "<leader>|", "<cmd>vsplit<cr>", { desc = "Splits the window vertically" })
map("n", "<leader>-", "<cmd>split<cr>", { desc = "Splits the window horizontally" })

map("n", "L", "$")
map("n", "H", "^")

map("n", "<leader>lo", function()
	vim.lsp.buf.code_action({
		apply = true,
		context = {
			only = { "source.organizeImports.ts" },
			diagnostics = {},
		},
	})
end)

-- Terminal
map("n", "<leader>t", "<cmd>exe v:count1 . 'ToggleTerm name=terminal'<cr>", { desc = "Open or toggle terminal" })

-- Disable annoying Q
map("n", "Q", "<nop>")

-- Turn the current file into an executable
map("n", "<leader>x", "<cmd>!chmod +x %<CR>", { desc = "Turn the current file into an executable", silent = true })

-- Edit easily .gitlab-ci.yml files
map("n", "<leader>.", "<cmd>e .gitlab-ci.yml<CR>", { desc = "Opens the Gitlab CI file to be edited." })
