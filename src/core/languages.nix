_: {
  vim = {
    # Syntax highlighting
    syntaxHighlighting = true;
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
