_: {
  # Import Nix modules
  imports = [
    ./keymaps.nix
    ./autocmds.nix

    # Language support with LSPs, snippets, syntax highlighting etc
    ./languages.nix
    ./lsp.nix
    ./autocompletion.nix

    # Debugging
    ./debugging.nix

    # Handy UI stuff
    ./ui.nix
    ./filetree.nix
  ];

  # Core Neovim config
  vim = {
    # Experimental Lua module loader to speed up the start up process
    enableLuaLoader = true;

    # General
    lineNumberMode = "relNumber";
    spellcheck.enable = true;
    options = {
      updatetime = 200;
      clipboard = "unnamedplus";

      # Indentation
      autoindent = false;
      shiftwidth = 2;
      tabstop = 2;

      # Word wrapping
      wrap = false;
    };
  };
}
