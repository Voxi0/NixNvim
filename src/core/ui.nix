{pkgs, ...}: {
  ##################
  ### APPEARANCE ###
  ##################
  vim = {
    # Theme
    theme = {
      enable = true;
      name = "rose-pine";
      style = "main";
    };

    # Statusline
    statusline.lualine.enable = true;

    # Fancy and configurable notification manager
    notify.nvim-notify.enable = true;

    # UI
    ui = {
      # Replaces the UI for messages, cmdline and the popupmenu
      noice.enable = true;

      # Code folding
      nvim-ufo.enable = true;

      # Provides code context in the winbar
      breadcrumbs.enable = true;

      # Color highlighter
      colorizer.enable = true;

      # Offers a simple and intuitive interface for code actions
      fastaction.enable = true;
    };
    visuals = {
      # Icons
      nvim-web-devicons.enable = true;

      # Extensible UI for Neovim notifications and LSP progress messages
      fidget-nvim.enable = true;

      # Smooth-scrolling for all commands
      cinnamon-nvim.enable = true;
    };

    # Extra plugins
    extraPlugins = with pkgs.vimPlugins; {
      bufferline = {
        package = bufferline-nvim;
        setup = ''
          require('bufferline').setup ({
            options = {
              always_show_bufferline = true,
              sort_by = "insert_after_current",
              separator_style = "thin",
              diagnostics = "nvim_lsp",
              indicator = { style = "none" },
              show_close_icon = false,
            },
          })
        '';
      };
    };
  };
}
