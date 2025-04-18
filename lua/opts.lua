-- #############
-- ## GLOBALS ##
-- #############
local g = vim.g

-- Disable the default Neovim file explorer (REQUIRED) - We'll use something else
g.loaded_netrw = 1
g.loaded_netrwPlugin = 1

-- #############
-- ## OPTIONS ##
-- #############
local o = vim.opt

-- Decrease update time for performance
o.updatetime = 250
o.timeoutlen = 300

-- Nice to have
o.fillchars = { eob = " " } -- Set what character to display for empty lines
o.termguicolors = true -- Ensure that Neovim shows the "best" version of a colorscheme if the terminal supports it
o.spell = true -- Spell checking
o.wrap = false -- Don't wrap text around the screen horizontally
o.mouse = "a" -- Mouse mode
o.clipboard = "unnamedplus" -- Clipboard
o.completeopt = "menu,preview,noselect" -- For a better completion experience
o.undofile = true -- Save undo history
o.breakindent = true -- Stops line wrapping from being confusing
o.scrolloff = 10 -- Minimal number of screen lines to keep above and below the cursor
o.inccommand = "split" -- Preview substitutions live as you type

-- Highlight on search and enable case-insensitive searching UNLESS \C or capital in search
o.hlsearch = true
o.ignorecase = true
o.smartcase = true

-- Signcolumn and line numbers
o.signcolumn = "yes"
o.number = true
o.relativenumber = true

-- Indentation
-- o.smarttab = true
-- o.smartindent = true
-- o.autoindent = true
-- o.softtabstop = 4
o.expandtab = false
o.tabstop = 2
o.shiftwidth = 2

-- Code folding
o.foldenable = true
o.foldcolumn = "0"
o.foldtext = ""
o.foldlevel = 99
o.foldlevelstart = 99
