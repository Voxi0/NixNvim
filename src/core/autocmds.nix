{lib, ...}: {
  vim = {
    # Keymaps
    keymaps = [];

    # Autocommands
    autocmds = [
      # Disable auto comment on enter
      {
        enable = true;
        desc = "Disable auto comment on enter";
        event = ["FileType"];
        callback = lib.mkLuaInline ''
          function()
          	vim.opt.formatoptions:remove { "c", "r", "o" }
          end
        '';
      }
    ];
  };
}
