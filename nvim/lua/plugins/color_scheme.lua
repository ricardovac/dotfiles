-- return {
-- 	{
-- 		"catppuccin/nvim",
-- 		config = function()
-- 			require("catppuccin").setup({
-- 				integrations = {
-- 					cmp = true,
-- 					gitsigns = true,
-- 					harpoon = true,
-- 					illuminate = true,
-- 					indent_blankline = {
-- 						enabled = false,
-- 						scope_color = "sapphire",
-- 						colored_indent_levels = false,
-- 					},
-- 					mason = true,
-- 					native_lsp = { enabled = true },
-- 					notify = true,
-- 					nvimtree = true,
-- 					neotree = true,
-- 					symbols_outline = true,
-- 					telescope = true,
-- 					treesitter = true,
-- 					treesitter_context = true,
-- 				},
-- 			})
--
-- 			vim.cmd.colorscheme("catppuccin")
--
-- 			-- Hide all semantic highlights until upstream issues are resolved (https://github.com/catppuccin/nvim/issues/480)
-- 			for _, group in ipairs(vim.fn.getcompletion("@lsp", "highlight")) do
-- 				vim.api.nvim_set_hl(0, group, {})
-- 			end
-- 		end,
-- 	},
-- }

-- return {
-- 	"neanias/everforest-nvim",
-- 	version = false,
-- 	lazy = false,
-- 	priority = 1000, -- make sure to load this before all the other start plugins
-- 	-- Optional; default configuration will be used if setup isn't called.
-- 	config = function()
-- 		require("everforest").setup({
--       vim.cmd("colorscheme everforest"),
-- 		})
-- 	end,
-- }

-- return {
-- 	{
-- 		"savq/melange-nvim",
-- 	config = function()
--       vim.cmd("colorscheme melange")
-- 	end,
-- 	},
--
--
return {
	"Mofiqul/vscode.nvim",
	lazy = false, -- make sure we load this during startup if it is your main colorscheme
	priority = 1000, -- make sure to load this before all the other start plugins
	config = function()
		-- load the colorscheme here
		vim.cmd.colorscheme("vscode")
	end,
}
--
-- }
