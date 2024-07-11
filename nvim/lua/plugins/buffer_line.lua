return {
	{
		"akinsho/nvim-bufferline.lua",
		opts = {
			options = {
				view = "multiwindow",
				mappings = true,
				buffer_close_icon = "",
				modified_icon = "●",
				close_icon = "",
				right_trunc_marker = "",
				max_name_length = 18,
				max_prefix_length = 15, -- prefix used when a buffer is deduplicated
				tab_size = 18,
				diagnostics = "nvim_lsp",
				-- diagnostics_indicator = function(count, level)
				-- return "("..count..")"
				-- end,
				show_buffer_close_icons = false,
				persist_buffer_sort = true, -- whether or not custom sorted buffers should persist
				-- can also be a table containing 2 custom separators
				-- [focused and unfocused]. eg: { '|', '|' }
				-- separator_style = "slant",
				enforce_regular_tabs = true,
				always_show_bufferline = true,
				sort_by = "relative_directory",

				diagnostics_indicator = function(_, _, diagnostics_dict)
					local s = " "
					for e, n in pairs(diagnostics_dict) do
						local sym = e == "error" and " " or (e == "warning" and " " or "")
						s = s .. n .. sym
					end
					return s
				end,
			},
		},
		keys = {
			{ "<space>t", "<Cmd>BufferLinePick<CR>", desc = "Buffer picker" },
			{ "<leader>bp", "<Cmd>BufferLineTogglePin<CR>", desc = "Toggle pin" },
			{ "<leader>bP", "<Cmd>BufferLineGroupClose ungrouped<CR>", desc = "Delete non-pinned buffers" },
			{ "<leader>1", "<Cmd>BufferLineGoToBuffer 1<CR>" },
			{ "<leader>2", "<Cmd>BufferLineGoToBuffer 2<CR>" },
			{ "<leader>3", "<Cmd>BufferLineGoToBuffer 3<CR>" },
			{ "<leader>4", "<Cmd>BufferLineGoToBuffer 4<CR>" },
			{ "<leader>5", "<Cmd>BufferLineGoToBuffer 5<CR>" },
			{ "<leader>6", "<Cmd>BufferLineGoToBuffer 6<CR>" },
			{ "<leader>7", "<Cmd>BufferLineGoToBuffer 7<CR>" },
			{ "<leader>8", "<Cmd>BufferLineGoToBuffer 8<CR>" },
			{ "<leader>9", "<Cmd>BufferLineGoToBuffer 9<CR>" },
			{ "\\", "<Cmd>BufferLineCycleNext<CR>" },
			{ "|", "<Cmd>BufferLineCyclePrev<CR>" },
			{ "<leader><\\>", "<Cmd>BufferLineCyclePrev<CR>" },
			{ "<leader>nd", "<Cmd>bd<CR>" },
		},
	},
}
