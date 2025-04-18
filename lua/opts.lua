-- #############
-- ## GLOBALS ##
-- #############
-- Disable the default Neovim file explorer (REQUIRED) - We'll use something else
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- #############
-- ## OPTIONS ##
-- #############
-- Decrease update time for performance
vim.opt.updatetime = 250
vim.opt.timeoutlen = 300

-- Nice to have
vim.opt.fillchars = { eob = ' ' } -- Set what character to display for empty lines
vim.opt.termguicolors = true -- Ensure that Neovim shows the "best" version of a colorscheme if the terminal supports it
vim.opt.spell = true -- Spell checking
vim.opt.wrap = false -- Don't wrap text around the screen horizontally
vim.opt.mouse = 'a' -- Mouse mode
vim.opt.clipboard = 'unnamedplus' -- Clipboard
vim.opt.completeopt = 'menu,preview,noselect' -- For a better completion experience
vim.opt.undofile = true -- Save undo history
vim.opt.breakindent = true -- Stops line wrapping from being confusing
vim.opt.scrolloff = 10 -- Minimal number of screen lines to keep above and below the cursor
vim.opt.inccommand = 'split' -- Preview substitutions live as you type

-- Highlight on search and enable case-insensitive searching UNLESS \C or capital in search
vim.opt.hlsearch = true
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- Signcolumn and line numbers
vim.opt.signcolumn = 'yes'
vim.opt.number = true
vim.opt.relativenumber = true

-- Indentation
-- vim.opt.smarttab = true
-- vim.opt.smartindent = true
-- vim.opt.autoindent = true
-- vim.opt.softtabstop = 4
vim.opt.expandtab = false
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2

-- Code folding
vim.opt.foldenable = true
vim.opt.foldcolumn = '0'
vim.opt.foldtext = ''
vim.opt.foldlevel = 99
vim.opt.foldlevelstart = 99
