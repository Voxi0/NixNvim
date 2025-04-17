{
  description = "Voxi0's nixCats config";

  # Flake inputs/depedencies
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-unstable";
    nixCats.url = "github:BirdeeHub/nixCats-nvim";
  };

  # Flake outputs/actions - After fetching all depedencies
  outputs = { self, nixpkgs, nixCats, ... }@inputs: let
    inherit (nixCats) utils;
    luaPath = "${./.}";
    forEachSystem = utils.eachSystem nixpkgs.lib.platforms.all;

    # Values to pass o the config set of `nixpkgs`
    # Won't apply to module imports as that will have your system values
    extra_pkg_config.allowUnfree = true;

    # This overlay grabs all the inputs named in the format `plugins-<plugin_name>`
    # Once added to `nixpkgs` we can use `pkgs.vimPlugins` which is a set of our plugins
    # Add any other flake overlays here
    dependencyOverlays = [ (utils.standardPluginOverlay inputs) ];

    # Categories
    categoryDefinitions = { pkgs, settings, categories, extra, name, mkPlugin, ... }@packageDef: {
      # Define a new category by simply adding a new list here

      # LSP and runtime depedencies - Made available at runtime for plugins and LSPs
      # Will also be available to PATH in the Neovim terminal
      lspsAndRuntimeDeps = {};

      # Plugins loaded at startup
      startupPlugins.general = with pkgs.vimPlugins; [
        lze lzextras
        nvim-web-devicons
        neo-tree-nvim
        lualine-nvim
      ];

      # Plugins not automatically loaded at startup
      # Use with packadd and an autocommand in config to achieve lazy loading
      optionalPlugins.general = with pkgs.vimPlugins; [];

      # Shared libraries to add to `LD_LIBRARY_PATH` available to Neovim runtime
      sharedLibraries.general = with pkgs; [];

      # Environment variables made available at runtime for plugins and to PATH in the Neovim terminal
      environmentVariables = {};

      # If you know what these are, you can provide custom ones by category here.
      # If you dont, check this link out:
      # https://github.com/NixOS/nixpkgs/blob/master/pkgs/build-support/setup-hooks/make-wrapper.sh
      extraWrapperArgs = {};

      # Functions to pass to `python.withPackages` or `lua.withPackages`
      # Don't forget to set `hosts.python3.enable` in package settings
      # Get the path to this Python environment in Lua config via `vim.g.python3_host_prog`
      # Or run from Neovim terminal via `:!<package_name>-python3`
      python3.libraries = {};

      # Populates $LUA_PATH and $LUA_CPATH
      extraLuaPackages = {};
    };

    # Build a package with specific categories from above - Can define as many packages as you desire
    # Categories to be enabled must be marked `true` but `false` may be omitted
    # This entire set is also passed to nixCats for querying in Lua
    packageDefinitions = {
      nvim = { pkgs, name, ... }: {
        # Settings
        settings = {
          suffix-path = true;
          suffix-LD = true;
          wrapRc = true;
          aliases = [ "vi" "vim" ];   # Your alias may not conflict with other packages
          # neovim-unwrapped = inputs.neovim-nightly-overlay.packages.${pkgs.system}.neovim;
        };

        # Enabled categories
        categories.general = true;
      };
    };

    # Default package definitions entry to use by default
    defaultPackageName = "nvim";
  in forEachSystem(system: let
      # Build nixCats
      nixCatsBuilder = utils.baseBuilder luaPath {
        inherit nixpkgs system dependencyOverlays extra_pkg_config;
      } categoryDefinitions packageDefinitions;
      defaultPackage = nixCatsBuilder defaultPackageName;

      # Just for using utils such as `pkgs.mkShell`
      # The one used to build Neovim is resolved inside the builder and is also passed to `categoryDefinitions` and `packageDefinitions`
      pkgs = import nixpkgs { inherit system; };
    in {
      # Outputs are wrapped with `${system}` by `utils.eachSystem`
      # This makes a package out of each entry in `packageDefinitions` and set the default package to the one passed here
      packages = utils.mkAllWithDefault defaultPackage;

      # Choose your package for devShell and add whatever else you desire
      devShells = {
        default = pkgs.mkShell {
          name = defaultPackageName;
          packages = [ defaultPackage ];
          inputsFrom = [ ];
          shellHook = ''
          '';
        };
      };
    }) // {
    inherit utils;
    inherit (utils) templates;

    # Export a NixOS/Home Manager module to allow reconfiguration
    nixosModules.default = utils.mkNixosModules {
      moduleNamespace = [ defaultPackageName ];
      inherit defaultPackageName dependencyOverlays luaPath
        categoryDefinitions packageDefinitions extra_pkg_config nixpkgs;
    };
    homeModules.default = utils.mkHomeModules {
      moduleNamespace = [ defaultPackageName ];
      inherit defaultPackageName dependencyOverlays luaPath
        categoryDefinitions packageDefinitions extra_pkg_config nixpkgs;
    };

    # These aren't wrapped with `${system}`
    # This makes an overlay out of each entry in `packageDefinitions` and sets the default overlay to the one named here
    overlays = utils.makeOverlays luaPath {
      inherit nixpkgs dependencyOverlays extra_pkg_config;
    } categoryDefinitions packageDefinitions defaultPackageName;
  };
}

