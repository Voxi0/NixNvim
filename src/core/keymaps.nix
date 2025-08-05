_: {
  vim = {
    # Set leader key
    globals = {
      mapleader = " ";
      maplocalleader = " ";
    };

    # Show available key bindings as you type
    binds.whichKey = {
      enable = true;
      setupOpts.preset = "helix";
    };

    # Keymaps
    keymaps = [
      # Line numbers
      {
        desc = "Toggle line numbers";
        mode = ["n"];
        key = "<leader>n";
        action = "<CMD>set number!<CR>";
      }
      {
        desc = "Toggle relative line numbers";
        mode = ["n"];
        key = "<leader>rn";
        action = "<CMD>set relativenumber!<CR>";
      }

      # Delete without yanking/copying
      {
        desc = "Delete";
        mode = ["n" "v"];
        key = "d";
        action = ''"_d'';
      }

      # Better indenting in visual mode
      {
        desc = "Indent left and reselect";
        mode = "v";
        key = "<";
        action = "<gv";
      }
      {
        desc = "Indent right and reselect";
        mode = "v";
        key = ">";
        action = ">gv";
      }

      # Clear search highlights
      {
        desc = "Clear search highlights";
        mode = "n";
        key = "<Escape>";
        action = "<CMD>nohlsearch<CR>";
      }

      # Splitting and resizing
      {
        desc = "Split window vertically";
        mode = "n";
        key = "<leader>sv";
        action = "<CMD>vsplit<CR>";
      }
      {
        desc = "Split window horizontally";
        mode = "n";
        key = "<leader>sh";
        action = "<CMD>split<CR>";
      }
      {
        desc = "Increase window height";
        mode = "n";
        key = "<C-Up>";
        action = "<CMD>resize +2<CR>";
      }
      {
        desc = "Decrease window height";
        mode = "n";
        key = "<C-Down>";
        action = "<CMD>resize -2<CR>";
      }
      {
        desc = "Increase window width";
        mode = "n";
        key = "<C-Right>";
        action = "<CMD>vertical resize -2<CR>";
      }
      {
        desc = "Decrease window width";
        mode = "n";
        key = "<C-Left>";
        action = "<CMD>vertical resize +2<CR>";
      }

      # Better window navigation
      {
        desc = "Move to left window";
        mode = "n";
        key = "<C-h>";
        action = "<C-w>h";
      }
      {
        desc = "Move to bottom window";
        mode = "n";
        key = "<C-j>";
        action = "<C-w>j";
      }
      {
        desc = "Move to top window";
        mode = "n";
        key = "<C-k>";
        action = "<C-w>k";
      }
      {
        desc = "Move to right window";
        mode = "n";
        key = "<C-l>";
        action = "<C-w>l";
      }
    ];
  };
}
