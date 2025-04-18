-- Import everything
require 'opts'
require 'keymaps'
require 'autocmds'
require('lze').load 'plugins'

-- Set the theme/colorscheme
vim.cmd.colorscheme(nixCats 'colorscheme')
