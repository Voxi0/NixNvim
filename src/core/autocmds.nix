{lib, ...}: {
  vim = {
    # Autogroups
    augroups = [
      {
        enable = true;
        name = "UserConfig";
        clear = true;
      }
    ];

    # Autocommands
    autocmds = [
      # Disable auto comment on enter
      {
        enable = true;
        group = "UserConfig";
        desc = "Disable auto comment on enter";
        event = ["FileType"];
        callback = lib.mkLuaInline ''
          function()
          	vim.opt.formatoptions:remove { "c", "r", "o" }
          end
        '';
      }

      # Highlight yanked text
      {
        enable = true;
        group = "UserConfig";
        desc = "Highlight yanked/copied text";
        event = ["TextYankPost"];
        callback = lib.mkLuaInline ''
          function()
            vim.highlight.on_yank()
          end
        '';
      }

      # Auto-resize splits when Neovim window is resized
      {
        enable = true;
        group = "UserConfig";
        desc = "Auto-resize splits when Neovim window is resized";
        event = ["VimResized"];
        callback = lib.mkLuaInline ''
          function()
            vim.cmd("tabdo wincmd =")
          end
        '';
      }
    ];
  };
}
