_: {
  # Neotree file explorer
  vim = {
    filetree.neo-tree.enable = true;

    # Key bindings
    keymaps = [
      # Toggle file explorer
      {
        desc = "Toggle Neotree (File Explorer)";
        key = "<leader>e";
        mode = "n";
        action = "<CMD>Neotree toggle<CR>";
      }
    ];
  };
}
