return {
	-- Shows available keybindings in a popup as you type to help you remember them
	{
		"which-key.nvim",
		after = function()
			require("which-key").setup {
				preset = "helix",
				notify = true,
				show_help = true,
				show_keys = true,
				debug = false,
				icons = {
					mappings = true,
					colors = true,
				},
			}
		end,
	},
}
