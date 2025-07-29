{pkgs, ...}: {
  vim = {
    # Git integration
    git = {
      enable = true;
      gitsigns.enable = true;
    };

    # Fuzzy finder
    telescope = {
      enable = true;
      extensions = [
        {
          name = "fzf";
          packages = [pkgs.vimPlugins.telescope-fzf-native-nvim];
          setup = {fzf = {fuzzy = true;};};
        }
      ];
    };

    # Mini.nvim
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
    };
  };
}
