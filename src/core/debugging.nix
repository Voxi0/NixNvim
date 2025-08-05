_: {
  #################
  ### DEBUGGING ###
  #################
  vim = {
    diagnostics = {
      enable = true;
      nvim-lint.enable = true;
    };
    debugger.nvim-dap = {
      enable = true;
      ui.enable = true;
    };

    languages = {
      enableDAP = true;
      enableExtraDiagnostics = true;
    };
  };
}
