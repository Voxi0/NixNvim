-- Highlight on yank
local highlightGroup = vim.api.nvim_create_augroup('YankHighlight', { clear = true })
vim.api.nvim_create_autocmd('TextYankPost', {
  callback = function()
    vim.highlight.on_yank()
  end,
  group = highlightGroup,
  pattern = '*',
})

-- Disable auto comment on enter
vim.api.nvim_create_autocmd('FileType', {
  desc = 'remove formatoptions',
  callback = function()
    vim.opt.formatoptions:remove { 'c', 'r', 'o' }
  end,
})
