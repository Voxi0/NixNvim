_: {
  ##################
  ### APPEARANCE ###
  ##################
  vim = {
    dashboard.alpha.enable = true;
    statusline.lualine.enable = true;
    notify.nvim-notify.enable = true;
    theme = {
      enable = true;
      name = "catppuccin";
      style = "mocha";
    };

    # Tabline - Shows open file buffers
    tabline.nvimBufferline.enable = true;

    # UI
    ui = {
      noice.enable = true;
      modes-nvim.enable = true;
      breadcrumbs.enable = true;
      colorizer.enable = true;
      fastaction.enable = true;
    };
    visuals = {
      nvim-web-devicons.enable = true;
      indent-blankline.enable = true;
      fidget-nvim.enable = true;
      cellular-automaton.enable = true;
      cinnamon-nvim.enable = true;
    };
  };
}
