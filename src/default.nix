{lib, ...}: {
  # Import Nix modules
  imports = [
		./core
    ./looks.nix
    ./filetree.nix
		./debugging.nix
  ];

  vim = {
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

    # Useful
    clipboard.enable = true;
    syntaxHighlighting = true;
    treesitter = {
      enable = true;
      addDefaultGrammars = true;
      autotagHtml = true;
    };
    lsp = {
      enable = true;
      formatOnSave = true;
      lightbulb.enable = true;
      lspconfig.enable = true;
      lspkind.enable = true;
      trouble.enable = true;
    };
    git = {
      enable = true;
      gitsigns.enable = true;
    };
    fzf-lua = {
      enable = true;
      profile = "telescope";
    };

    # Mini
    mini = {
      icons.enable = true;
      indentscope.enable = true;
      sessions.enable = true;
    };

    # Autocompletion and formatter
    snippets.luasnip.enable = true;
    autocomplete.blink-cmp = {
      enable = true;
      friendly-snippets.enable = true;
      mappings = {
        confirm = "<Tab>";
        next = "<Shift> + <Tab>";
      };
    };

    autopairs.nvim-autopairs.enable = true;
    binds = {
      whichKey.enable = true;
      hardtime-nvim.enable = true;
    };
    languages = {
      enableTreesitter = true;
      enableFormat = true;

      nix.enable = true;
      zig.enable = true;
    };

    # Discord rich presence
    presence.neocord = {
      enable = true;
      setupOpts.global_timer = true;
    };

    # Obsidian and TODO comments
    notes = {
      todo-comments.enable = true;
    };
  };
}
