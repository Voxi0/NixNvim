{
  description = "Voxi0's NixCats config";

  # Dependencies
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-unstable";
    nixCats.url = "github:BirdeeHub/nixCats-nvim";
  };

  # Actions
  outputs = { self, nixpkgs, nixCats, ... }@inputs: let
    inherit (nixCats) utils;
    luaPath = "${./.}";
    forEachSystem = utils.eachSystem nixpkgs.lib.platforms.all;

    # Values to be passed to the config set of Nixpkgs
    # Will not apply to module imports as that will have your system values
    extra_pkg_config.allowUnfree = true;

    # Grabs all the inputs named in the format `plugins-<plugin_name>`
    # Once added to Nixpkgs, `pkgs.neovimPlugins` can be used which is a set of our plugins
    dependencyOverlays = [ (utils.standardPluginOverlay inputs) ];

    # Categories
    categoryDefinitions = { pkgs, settings, categories, extra, name, mkNvimPlugin, ... }@packageDef: {
      # Dependencies that should be available at runtime for plugins
      # Will be available to PATH within the Neovim terminal including LSPs
      lspsAndRuntimeDeps = with pkgs; {
        general = [
          universal-ctags
          curl
          lazygit
          ripgrep
          fd
          stdenv.cc.cc
          lua-language-server
          nil
          stylua
        ];
      };

      # Plugins - Don't have to download everything via Nix
      startupPlugins = with pkgs.vimPlugins; {
        general = [
          lazy-nvim LazyVim
          bufferline-nvim
          lazydev-nvim
          cmp-buffer cmp-nvim-lsp cmp-path cmp_luasnip
          conform-nvim
          dashboard-nvim
          dressing-nvim
          flash-nvim
          friendly-snippets
          gitsigns-nvim
          indent-blankline-nvim
          lualine-nvim
          neo-tree-nvim
          neoconf-nvim
          neodev-nvim
          noice-nvim
          nui-nvim
          nvim-cmp
          nvim-lint
          nvim-lspconfig
          nvim-notify
          nvim-spectre
          nvim-treesitter-context
          nvim-treesitter-textobjects
          nvim-ts-autotag
          nvim-ts-context-commentstring
          nvim-web-devicons
          persistence-nvim
          plenary-nvim
          telescope-fzf-native-nvim
          telescope-nvim
          todo-comments-nvim
          tokyonight-nvim
          trouble-nvim
          vim-illuminate
          vim-startuptime
          which-key-nvim
          snacks-nvim
          nvim-treesitter-textobjects
          nvim-treesitter.withAllGrammars
          # This is for if you only want some of the grammars
          # (nvim-treesitter.withPlugins (
          #   plugins: with plugins; [
          #     nix
          #     lua
          #   ]
          # ))

          # Sometimes you have to fix the names
          { plugin = luasnip; name = "LuaSnip"; }
          { plugin = catppuccin-nvim; name = "catppuccin"; }
          { plugin = mini-ai; name = "mini.ai"; }
          { plugin = mini-icons; name = "mini.icons"; }
          { plugin = mini-bufremove; name = "mini.bufremove"; }
          { plugin = mini-comment; name = "mini.comment"; }
          { plugin = mini-indentscope; name = "mini.indentscope"; }
          { plugin = mini-pairs; name = "mini.pairs"; }
          { plugin = mini-surround; name = "mini.surround"; }
        ];
      };
      optionalPlugins = {};

      # Added to `LD_LIBRARY_PATH` variable avialable to Neovim runtime
      sharedLibraries = {general = [];};

      # Environment variables made available at runtime for plugins
      # Will be avialable to path within Neovim terminal
      environmentVariables = {};

      # If you know what these are, you can provide custom ones by category here.
      # If you dont, check this link out:
      # https://github.com/NixOS/nixpkgs/blob/master/pkgs/build-support/setup-hooks/make-wrapper.sh
      extraWrapperArgs = {};

      # Functions you would've passed to `python.withPackages` or `lua.withPackages`
      # Get the path to this Python environment in your Lua config via `vim.g.python3_host_prog`
      # Or run from Neovim terminal via `:!<package_name>-python3`
      python3.libraries = {};

      # Populates `$LUA_PATH` and `$LUA_CPATH`
      extraLuaPackages = {};
    };

    # Default `packageDefinitions` entry to be used
    defaultPackageName = "nvim";

    # Define packages with specific categories from `categoryDefinitions`
    # All categories to be used must be marked `true`, `false` may be omitted
    packageDefinitions = {
      # Package names - You can include as many as you wish
      nvim = { pkgs, mkNvimPlugin, ... }: {
        # See `:help nixCats.flake.outputs.settings`
        settings = {
          # neovim-unwrapped = inputs.neovim-nightly-overlay.packages.${pkgs.system}.neovim;
          wrapRc = true;

          # NOTE: Your alias may not conflict with your other packages
          aliases = [ "vi" "vim" ];
        };

        # Categories and other information to pass to Lua
        extra = {};
        categories = {
          general = true;
          test = false;
        };
      };

      # Test package with normal Lua reload for fast edits
      # The config isn't provided in this package allowing you to edit freely
      # Just swap back to the normal pure package when done
      testing = { pkgs, mkNvimPlugin, ... }: {
        # See `:help nixCats.flake.outputs.settings`
        settings = {
          wrapRc = false;
          unwrappedCfgPath = "/absolute/path/to/config";
        };

        # Categories and other information to pass to Lua
        extra = {};
        categories = {
          general = true;
          test = false;
        };
      };
    };
  in forEachSystem (system: let
      # The builder function
      nixCatsBuilder = utils.baseBuilder luaPath {
        inherit nixpkgs system dependencyOverlays extra_pkg_config;
      } categoryDefinitions packageDefinitions;
      defaultPackage = nixCatsBuilder defaultPackageName;

      # Just for usiing utils e.g. `pkgs.mkShell`
      pkgs = import nixpkgs { inherit system; };
    in {
      packages = utils.mkAllWithDefault defaultPackage;
      devShells.default = pkgs.mkShell {
        name = defaultPackageName;
        packages = [ defaultPackage ];
        inputsFrom = [ ];
        shellHook = ''
        '';
      };
    }
  ) // ({
    inherit utils;
    inherit (utils) templates;
    nixosModules.default = utils.mkNixosModules {
      inherit defaultPackageName dependencyOverlays luaPath
        categoryDefinitions packageDefinitions extra_pkg_config nixpkgs;
    };
    homeModules.default = utils.mkHomeModules {
      inherit defaultPackageName dependencyOverlays luaPath
        categoryDefinitions packageDefinitions extra_pkg_config nixpkgs;
    };
    overlays = utils.makeOverlays luaPath {
      inherit nixpkgs dependencyOverlays extra_pkg_config;
    } categoryDefinitions packageDefinitions defaultPackageName;
  });
}
