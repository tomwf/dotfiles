local set = vim.opt
-- Default indent with 2 spaces
set.expandtab = true
set.shiftwidth = 2
set.tabstop = 2
-- Show hybrid line number
set.number = true
set.relativenumber = true
-- Autoindent in new line
set.smartindent = true
-- Use indent as a fold
set.foldmethod = "indent"
set.foldlevelstart = 99
-- Disable hightlight
set.hlsearch = false
set.incsearch = true
-- Yank to clipboard
set.clipboard:append("unnamedplus")
