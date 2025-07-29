_: {
  vim = {
    # Git integration
    git = {
      enable = true;
      gitsigns.enable = true;
    };

    # Super fast and efficient fuzzy finder
    fzf-lua = {
      enable = true;
      profile = "telescope";
    };

    # Mini
    mini.sessions.enable = true;

    # TODO comments
    notes.todo-comments.enable = true;

    # Discord rich presence
    presence.neocord = {
      enable = true;
      setupOpts.global_timer = true;
    };

    # Utilities
    utility = {
      # Color and icon picker
      ccc.enable = true;
      icon-picker.enable = true;

      # Markdown preview
      preview.glow.enable = true;

      # Nix
      nix-develop.enable = true;
    };
  };
}
