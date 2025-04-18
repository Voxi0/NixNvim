return {
  { 'noice.nvim', after = require('noice').setup() }, -- Experimental plugin completely replacing the UI
  { 'lualine.nvim', after = require('lualine').setup {} }, -- Fast and easy to use/configure statusline

  -- Library of 40+ independent Lua modules improving Neovim experience with minimal effort
  {
    'mini.nvim',
    after = function()
      require('mini.git').setup() -- Git integration

      -- Autopairs
      require('mini.pairs').setup {
        -- Modes in which mappings from this config are created
        modes = { insert = true, command = true, terminal = true },

        -- Extra characters to autopair
        mappings = {
          ['<'] = { action = 'open', pair = '<>' },
          ['>'] = { action = 'close', pair = '<>' },
        },
      }
    end,
  },

  -- Collection of Quality-of-Life (QoL) plugins for Neovim
  {
    'snacks.nvim',
    lazy = false,
    after = require('snacks').setup(),
    keys = {
      -- Toggle filetree explorer
      {
        '<leader>e',
        mode = 'n',
        desc = 'Toggle filetree explorer',
        function()
          require('snacks').explorer()
        end,
      },

      -- Find projects
      {
        '<leader>fp',
        mode = 'n',
        desc = 'Find projects',
        function()
          require('snacks').picker.projects()
        end,
      },

      -- Find files
      {
        '<leader>ff',
        mode = 'n',
        desc = 'Find files',
        function()
          require('snacks').picker.files()
        end,
      },

      -- Toggle LazyGit - Awesome and simple TUI for Git
      {
        '<leader>gg',
        mode = 'n',
        desc = 'Toggle LazyGit TUI',
        function()
          require('snacks').lazygit()
        end,
      },
    },
  },
}
