local bind = vim.keymap.set
local opts = { noremap = true, silent = true }
-- Leader key
vim.g.mapleader = ' '
-- Diagnostic
bind('n', '<leader>dj', ':lua vim.diagnostic.goto_next()<CR>zz', opts)
bind('n', '<leader>dk', ':lua vim.diagnostic.goto_prev()<CR>zz', opts)
-- Git
bind('n', '<leader>g', ':vertical Git<bar>%bd!<bar>b#<CR>', opts)
bind('n', '<leader>b', ':BlamerToggle<CR>', opts)
bind('n', '<leader>df', ':Gvdiff<CR>', opts)
-- Buffer
bind('n', '<C-k>', ':bp|bd#<CR>', opts)
bind('n', '<C-l>', ':bn<CR>', opts)
bind('n', '<C-h>', ':bp<CR>', opts)
bind('n', '<CR>', ':b#<CR>', opts)
-- Coc explorer
bind('n', '<leader>e', ':CocCommand explorer<CR>', opts)
-- Overwrite default
bind('n', '<C-j>', 'i<CR><Esc>')
bind('!', '<C-j>', '<Down>')
bind('!', '<C-k>', '<Up>')
bind('!', '<C-c>', '<Esc>')
bind('', '<C-c>', '<Esc>')
bind('n', 'Y', 'y$')
-- Center cursor
bind('n', '<C-f>', '<C-f>Mzz')
bind('n', '<C-b>', '<C-b>Mzz')
bind('n', '=G', '=Gzz')
bind('n', 'n', 'nzz')
bind('n', 'N', 'Nzz')
