_: {
	# Import Nix modules
	imports = [
		./autocmds.nix
	];

	vim = {
		# Experimental Lua module loader to speed up the start up process
    enableLuaLoader = true;

    # General
    globals.maplocalleader = " ";
    lineNumberMode = "relNumber";
    spellcheck.enable = true;
    options = {
      updatetime = 200;

      # Indentation
      autoindent = false;
      shiftwidth = 2;
      tabstop = 2;

      # Word wrapping
      wrap = false;
    };
	};
}
