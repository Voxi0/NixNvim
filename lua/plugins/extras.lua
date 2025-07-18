-- Extra stuff
return {
	-- Discord rich presence
	{
		"neocord",
		lazy = false,
		after = function()
			require("neocord").setup {
				-- General options
				logo = "auto",
				logo_tooltip = "The One True Editor",
				main_image = "language",
				show_time = true,
				global_timer = true,
				buttons = nil,

				-- Rich Presence text options
				editing_text = "Editing %s",
				file_explorer_text = "Browsing %s",
				git_commit_text = "Committing Changes",
				plugin_manager_text = "Managing Plugins",
				reading_text = "Reading %s",
				workspace_text = "Working on %s",
				line_number_text = "Line %s of %s",
				terminal_text = "Using The Terminal",
			}
		end,
	},
}
