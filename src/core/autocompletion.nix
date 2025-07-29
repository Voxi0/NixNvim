_: {
  vim = {
    # Snippets and autocompletion
    snippets.luasnip.enable = true;
    autocomplete.blink-cmp = {
      enable = true;
      friendly-snippets.enable = true;
      mappings = {
        confirm = "<Tab>";
        next = "<Shift> + <Tab>";
      };
    };
  };
}
