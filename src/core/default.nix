{pkgs, ...}: {
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
  ];

  # Core Neovim config
  vim = {
    # Extra packages
    extraPackages = with pkgs; [gcc fd ripgrep ghostscript tectonic mermaid-cli];

    # Experimental Lua module loader to speed up the start up process
    enableLuaLoader = true;

    # General
    lineNumberMode = "relNumber";
    spellcheck.enable = true;
    options = {
      # Indentation
      autoindent = false;
      smartindent = false;
      expandtab = true;
      shiftwidth = 2;
      tabstop = 2;
      softtabstop = 2;

      # Stop auto folding code
      foldlevel = 99;

      # Highlight the line that the cursor is on
      cursorline = true;

      # Lines/Columns to keep above/below and left/right cursor
      scrolloff = 10;
      sidescrolloff = 8;

      # Split behaviour
      splitbelow = true;
      splitright = true;

      # Search settings
      ignorecase = true;
      smartcase = true;
      hlsearch = true;
      incsearch = true;

      # File handling
      backup = false;
      writebackup = false;
      undofile = true;
      swapfile = false;
      autoread = true;
      autowrite = false;

      # Miscellaneous
      wrap = false;
      clipboard = "unnamedplus";
      mouse = "a";
      encoding = "UTF-8";

      # Performance
      updatetime = 200;
      redrawtime = 10000;
      maxmempattern = 20000;
    };
  };
}
