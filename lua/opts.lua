-- Decrease update time for performance
vim.o.updatetime = 250
vim.o.timeoutlen = 300

-- Nice to have
vim.opt.fillchars = { eob = ' ' } -- Set what character to display for empty lines
vim.o.termguicolors = true -- Ensure that Neovim shows the "best" version of a colorscheme if the terminal supports it
vim.o.mouse = 'a' -- Mouse mode
vim.o.clipboard = 'unnamedplus' -- Clipboard
vim.o.undofile = true -- Save undo history
vim.o.spell = true -- Spell checking
vim.o.wrap = false -- Don't wrap text around the screen horizontally
vim.o.breakindent = true -- Stops line wrapping from being confusing
vim.opt.inccommand = 'split' -- Preview substitutions live, as you type!

-- Highlight on search and enable case-insensitive searching UNLESS \C or capital in search
vim.opt.hlsearch = true
vim.o.ignorecase = true
vim.o.smartcase = true

-- Signcolumn and line numbers
vim.wo.signcolumn = 'yes'
vim.wo.number = true
vim.wo.relativenumber = true

-- Sets how neovim will display certain whitespace characters in the editor.
vim.opt.list = true
vim.opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' }

-- Disable the default Neovim file explorer (REQUIRED) - We use Neotree instead
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- Indentation
vim.o.expandtab = false
vim.o.tabstop = 2
vim.o.shiftwidth = 2

-- Code folding
vim.o.foldenable = true
vim.o.foldcolumn = '0'
vim.o.foldtext = ''
vim.o.foldlevel = 99
vim.o.foldlevelstart = 99
