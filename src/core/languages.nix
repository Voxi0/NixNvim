_: {
  vim = {
    # Syntax highlighting
    treesitter = {
      enable = true;
      addDefaultGrammars = true;
      autotagHtml = true;
    };

    # Language support
    languages = {
      enableTreesitter = true;
      enableFormat = true;

      nix.enable = true;
      zig.enable = true;
    };
  };
}
