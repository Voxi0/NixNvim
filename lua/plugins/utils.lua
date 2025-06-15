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

	-- Code folding
	{
		"nvim-ufo",
		after = function()
			-- Configure code folding
			opts = vim.o
			opts.foldcolumn = "1"
			opts.foldlevel = 99
			opts.foldlevelstart = 99
			opts.foldenable = true

			-- Must remap `zR` and `zM` if using Nvim-UFO provider
			vim.keymap.set("n", "zR", require("ufo").openAllFolds)
			vim.keymap.set("n", "zM", require("ufo").closeAllFolds)

			-- Initialize Nvim UFO
			require("ufo").setup()
		end,
	},
}
