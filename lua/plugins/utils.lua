return {
  -- Shows available keybindings in a popup as you type to help you remember them
  {
    'which-key.nvim',
    event = 'VeryLazy',
    keys = {
      {
        '<leader>?',
        desc = 'Buffer local keymaps (Which-Key)',
        function()
          require('which-key').show { global = false }
        end,
      },
    },
  },
}
