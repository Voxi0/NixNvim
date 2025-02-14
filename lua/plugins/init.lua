return {
  -- Discord rich presence
  {
    'IogaMaster/neocord',
    event = 'VeryLazy',
    opts = {
      -- General options
      logo = 'auto',
      logo_tooltip = nil,
      main_image = 'language',
      log_level = 'warn',
      debounce_timeout = 10,
      show_time = true,
      global_timer = true,

      -- Rich Presence text options
      editing_text = 'Editing %s',
      file_explorer_text = 'Browsing %s',
      git_commit_text = 'Committing Changes',
      plugin_manager_text = 'Managing Plugins',
      reading_text = 'Reading %s',
      workspace_text = 'Working on %s',
      line_number_text = 'Line %s Out of %s',
      terminal_text = 'Using The Terminal',
    },
  },
}
