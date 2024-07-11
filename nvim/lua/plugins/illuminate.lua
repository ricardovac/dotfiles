return {
	{
		"RRethy/vim-illuminate",
		lazy = true,
		config = function()
			require("illuminate").configure({
				enabled = false,
				under_cursor = false,
				filetypes_denylist = {
					"DressingSelect",
					"Outline",
					"TelescopePrompt",
					"alpha",
					"harpoon",
					"toggleterm",
					"neo-tree",
					"Spectre",
				},
			})
		end,
	},
}
