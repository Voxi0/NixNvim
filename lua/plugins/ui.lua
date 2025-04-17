return {
  'lualine.nvim',
  after = function(plugin)
    require('lualine').setup {
      options = {
        icons_enabled = true,
        theme = 'auto',
      },
    }
  end,
}
