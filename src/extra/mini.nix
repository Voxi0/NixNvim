_: {
  #################
  ### Mini.nvim ###
  #################
  vim = {
    mini = {
      pairs.enable = true;
      surround.enable = true;
      sessions.enable = true;
    };
    keymaps = [
      # Load `Session.vim` in current directory
      {
        desc = "Load project session";
        mode = "n";
        key = "<leader>ms";
        lua = true;
        action = "MiniSessions.read";
      }
    ];
  };
}
