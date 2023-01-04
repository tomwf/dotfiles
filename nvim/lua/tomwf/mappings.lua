local bind = vim.keymap.set
local opts = { noremap = true, silent = true }
-- Leader key
vim.g.mapleader = ' '
-- Diagnostic
bind('n', '<leader>dj', ':lua vim.diagnostic.goto_next()<CR>zz', opts)
bind('n', '<leader>dk', ':lua vim.diagnostic.goto_prev()<CR>zz', opts)
-- Git
bind('n', '<leader>g', ':vertical Git<bar>%bd!<bar>b#<CR>')
bind('n', '<leader>b', ':BlamerToggle<CR>')
bind('n', '<leader>df', ':Gvdiff<CR>')
-- Buffer
bind('n', '<C-k>', ':bn|bd#<CR>')
bind('n', '<C-l>', ':bn<CR>')
bind('n', '<C-h>', ':bp<CR>')
bind('n', '<CR>', ':b#<CR>')
-- Coc explorer
bind('n', '<leader>e', ':CocCommand explorer<CR>')
-- Overwrite default
bind('n', '<C-j>', 'i<CR><Esc>')
bind('!', '<C-j>', '<Down>')
bind('!', '<C-k>', '<Up>')
bind('!', '<C-c>', '<Esc>')
bind('', '<C-c>', '<Esc>')
bind('n', 'Y', 'y$')
-- Center cursor
bind('n', '<C-f>', '<C-f>M')
bind('n', '<C-b>', '<C-b>M')
bind('n', '=G', '=Gzz')
bind('n', 'n', 'nzz')
bind('n', 'N', 'Nzz')
