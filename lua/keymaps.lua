-- To shorten making keybinds
local map = vim.keymap.set

-- Set the leader key to spacebar
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- Disable highlight when esc key pressed
map('n', '<Esc>', '<CMD>nohlsearch<CR>', { desc = 'Disable search higlight' })

-- Super helpful and useful keymaps
-- "Control + S" to save file
map('n', '<C-s>', '<CMD>w<CR>', { desc = 'Save current file' })

-- Cursor movement in insert mode
map('i', '<C-b>', '<Esc>^i', { desc = 'Move to the beginning of the line' })
map('i', '<C-e>', '<End>', { desc = 'Move to the end of the line' })

map('v', 'J', ":m '>+1<CR>gv=gv", { desc = 'Moves Line Down' })
map('v', 'K', ":m '<-2<CR>gv=gv", { desc = 'Moves Line Up' })

-- Toggle line numbers and realtive line numbers
map('n', '<leader>n', '<CMD>set nu!<CR>', { desc = 'Toggle absolute line numbers' })
map('n', '<leader>nr', '<CMD>set rnu!<CR>', { desc = 'Toggle relative line numbers' })

-- Buffer controls
map('n', '<leader>bn', '<CMD>bn<CR>', { desc = 'Goto next buffer' })
map('n', '<leader>bp', '<CMD>bp<CR>', { desc = 'Goto previous buffer' })
map('n', '<leader>bl', '<CMD>b#<CR>', { desc = 'GOto last buffer' })
map('n', '<leader>bd', '<CMD>bd<CR>', { desc = 'Delete current buffer' })
