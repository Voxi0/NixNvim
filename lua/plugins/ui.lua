return {
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
    after = function()
      require('snacks').setup {
        -- Kewl dashboard
        -- dashboard = {
        --   enabled = true,
        --   sections = {
        --     { section = 'header' },
        --     { section = 'keys', gap = 1, padding = 1 },
        --     { section = 'startup' },
        --   },
        -- },
      }
    end,
  },

  -- Highly experimental plugin completely replacing the UI for messages, cmdline and popupmenu
  {
    'noice.nvim',
    after = function()
      require('noice').setup()
    end,
  },

  -- Blazingly fast and easy to configure Neovim statusline written in pure Lua
  {
    'lualine.nvim',
    after = function()
      require('lualine').setup {
        options = {
          icons_enabled = true,
          theme = 'auto',
        },
      }
    end,
  },
}
