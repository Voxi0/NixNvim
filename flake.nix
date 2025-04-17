{
  # Description
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
          lua-language-server   # Lua language server
          nil                   # Nix language server
          stylua                # Lua code formatter
        ];
      };

      # Plugins - Don't have to download everything via Nix
      startupPlugins = with pkgs.vimPlugins; {
        general = [
          # Lazy.nvim plugin manager and LazyVim distro
          lazy-nvim LazyVim

          vim-startuptime       # View Neovim startup event timing information

          # Quality-of-Life (QoL) and utility plugins
          neocord               # Discord rich presence
          which-key-nvim        # Show avialable keybindings in a popup as you type
          snacks-nvim           # Collection of small quality-of-life plugins for Neovim
          vim-illuminate        # Highlight other uses of the word under the cursor
          todo-comments-nvim    # Highlight, list and search todo comments in your projects

          # UI
          nvim-web-devicons     # Nerd font icons for use by Neovim plugins
          tokyonight-nvim       # Tokyonight theme/colorscheme
          noice-nvim            # Completely replaces the UI for messages, cmdline and the popup menu
          nvim-notify nui-nvim  # Notification manager for Neovim
          dashboard-nvim        # Fancy and blazingly fast start screen for Neovim
          neo-tree-nvim         # Filetree
          lualine-nvim          # Blazingly fast and easy to configure Neovim statusline written in Lua
          bufferline-nvim       # Snazzy bufferline for Neovim
          gitsigns-nvim         # Git integration for buffers
          indent-blankline-nvim # Show indentation guides
          flash-nvim            # Navigate your code with search labels, enhanced character motions and Treesitter integration

          # LSP, autocompletion, formatting, snippets and debugging
          lazydev-nvim          # Properly configures LuaLS for Neovim configuration
          nvim-lspconfig
          nvim-cmp
          cmp-buffer
          cmp-nvim-lsp
          cmp-path
          cmp_luasnip
          conform-nvim
          friendly-snippets
          trouble-nvim

          # Plugin to manage global and project-local settings
          neoconf-nvim

          nvim-lint
          nvim-spectre          # Search panel for Neovim
          persistence-nvim      # Simple session manager
          plenary-nvim          # All the most used Lua code for Neovim

          # Highly extendable fuzzy finder
          telescope-nvim
          telescope-fzf-native-nvim

          # Syntax highlighting
          nvim-treesitter.withAllGrammars
          nvim-treesitter-context
          nvim-ts-context-commentstring
          nvim-treesitter-textobjects
          nvim-ts-autotag

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
