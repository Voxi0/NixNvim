{lib, ...}: {
	# Import Nix modules
	imports = [
		./looks.nix
		./keymaps.nix
	];

  vim = {
    # Experimental Lua module loader to speed up the start up process
    enableLuaLoader = true;

		# Globals
		globals.maplocalleader = " ";

    # Debugging
    diagnostics.enable = true;
    debugger.nvim-dap = {
      enable = true;
      ui.enable = true;
    };

    # Useful
    clipboard.enable = true;
		git = {
			enable = true;
			gitsigns.enable = true;
		};
    lsp.enable = true;
    filetree.neo-tree.enable = true;
    fzf-lua = {
      enable = true;
      profile = "telescope";
    };

    # Autocompletion and formatter
    autocomplete.blink-cmp = {
      enable = true;
      friendly-snippets.enable = true;
      mappings = {
        confirm = "<Tab>";
        next = "<Shift> + <Tab>";
      };
    };
    formatter.conform-nvim = {
      enable = true;
      setupOpts = {
        formatters_by_ft = {
          nix = ["alejandra"];
          lua = ["stylua"];
        };
      };
    };

    autopairs.nvim-autopairs.enable = true;
    binds = {
      whichKey.enable = true;
      hardtime-nvim.enable = true;
    };
    languages = {
      enableTreesitter = true;
      nix.enable = true;
    };
  };
}
