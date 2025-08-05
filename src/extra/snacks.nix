_: {
  vim = {
    # Snacks.nvim
    utility.snacks-nvim = {
      enable = true;
      setupOpts = {
        explorer = {};
        picker = {};
        indent = {};
        lazygit = {};
        image = {};
        dashboard = {
          sections = [
            {section = "header";}
            {
              section = "keys";
              gap = 1;
              padding = 1;
            }
          ];
        };
      };
    };

    # Key bindings
    keymaps = [
      # File explorer
      {
        desc = "Toggle file explorer";
        mode = "n";
        key = "<leader>e";
        lua = true;
        action = "Snacks.picker.explorer";
      }

      # LazyGit
      {
        desc = "Toggle LazyGit";
        mode = "n";
        key = "<leader>gg";
        lua = true;
        action = "Snacks.lazygit.open";
      }

      # Fuzzy find
      {
        desc = "Fuzzy-find files";
        mode = "n";
        key = "<leader>ff";
        lua = true;
        action = "function() Snacks.picker.files ({focus = 'list'}) end";
      }
      {
        desc = "Fuzzy-find all files";
        mode = "n";
        key = "<leader>fs";
        lua = true;
        action = "function() Snacks.picker.smart({focus = 'list'}) end";
      }
      {
        desc = "Fuzzy-find open file buffers";
        mode = "n";
        key = "<leader>fb";
        lua = true;
        action = "function() Snacks.picker.buffers({focus = 'list'}) end";
      }

      # Toggle indentation guides
      {
        desc = "Toggle indentation guides";
        mode = "n";
        key = "<leader>ig";
        lua = true;
        action = "
          function()
            if Snacks.indent.enabled then
              Snacks.indent.disable()
            else
              Snacks.indent.enable()
            end
          end
          ";
      }
    ];
  };
}
