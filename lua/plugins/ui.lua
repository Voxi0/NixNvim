return {
	-- Fast and easy to use/configure statusline
	{
		"lualine.nvim",
		after = function()
			require("lualine").setup {}
		end,
	},

	-- Extensible UI for notifications and LSP progress messages
	{
		"fidget.nvim",
		after = function()
			require("fidget").setup {}
		end,
	},

	-- Library of 40+ independent Lua modules improving Neovim experience with minimal effort
	{
		"mini.nvim",
		after = function()
			require("mini.git").setup() -- Git integration

			-- Autopairs
			require("mini.pairs").setup {
				-- Modes in which mappings from this config are created
				modes = { insert = true, command = true, terminal = true },

				-- Extra characters to autopair
				mappings = {
					["<"] = { action = "open", pair = "<>" },
					[">"] = { action = "close", pair = "<>" },
				},
			}
		end,
	},
}
