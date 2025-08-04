_: {
  vim = {
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
    keymaps = [
      # File explorer
      {
        desc = "Toggle file explorer";
        key = "<leader>e";
        lua = true;
        action = "Snacks.picker.explorer";
        mode = "n";
        silent = true;
      }

      # LazyGit
      {
        desc = "Toggle LazyGit";
        key = "<leader>gg";
        lua = true;
        action = "Snacks.lazygit.open";
        mode = "n";
        silent = true;
      }

      # Fuzzy find
      {
        desc = "Fuzzy-find files";
        key = "<leader>ff";
        lua = true;
        action = "function() Snacks.picker.files ({focus = 'list'}) end";
        mode = "n";
        silent = true;
      }
      {
        desc = "Fuzzy-find all files";
        key = "<leader>fs";
        lua = true;
        action = "function() Snacks.picker.smart({focus = 'list'}) end";
        mode = "n";
        silent = true;
      }
      {
        desc = "Fuzzy-find open file buffers";
        key = "<leader>fb";
        lua = true;
        action = "function() Snacks.picker.buffers({focus = 'list'}) end";
        mode = "n";
        silent = true;
      }

      # Toggle indentation guides
      {
        desc = "Toggle indentation guides";
        key = "<leader>ig";
        lua = true;
        mode = "n";
        silent = true;
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
