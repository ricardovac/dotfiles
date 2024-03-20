return {
	{
		"zbirenbaum/copilot.lua",
		event = { "BufEnter" },
		config = function()
			require("copilot").setup({
				suggestion = {
					auto_trigger = true,
					keymap = {
						accept = "<Tab>",
						dismiss = "<M-/>",
					},
				},
			})
		end,
	},
}
