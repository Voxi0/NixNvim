_: {
  # Import Nix modules
  imports = [
    ./snacks.nix # Snacks-nvim
  ];
  vim = {
    # Git integration
    git = {
      enable = true;
      gitsigns.enable = true;
    };

    # Fuzzy finder
    # telescope = {
    #   enable = true;
    #   extensions = [
    #     {
    #       name = "fzf";
    #       packages = [pkgs.vimPlugins.telescope-fzf-native-nvim];
    #       setup = {fzf = {fuzzy = true;};};
    #     }
    #   ];
    # };
    # fzf-lua = {
    #   enable = true;
    #   profile = "telescope";
    # };

    # Mini.nvim
    mini = {
      pairs.enable = true;
      surround.enable = true;
      sessions = {
        enable = true;
        setupOpts.autoread = true;
      };
    };

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
