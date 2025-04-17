return {
  'neo-tree.nvim',
  after = function(plugin)
    require('neo-tree').setup()
    vim.keymap.set('n', '<leader>e', '<CMD>Neotree toggle<CR>', { desc = 'Toggle Neotree filetree explorer' })
  end,
}
