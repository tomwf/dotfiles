local keymap = vim.keymap
-- Leader key
vim.g.mapleader = ' '
-- Git
keymap.set('n', '<leader>g', ':vertical Git<bar>%bd!<bar>b#<CR>')
keymap.set('n', '<leader>b', ':BlamerToggle<CR>')
keymap.set('n', '<leader>df', ':Gvdiff<CR>')
-- Buffer
keymap.set('n', '<C-k>', ':bn|bd#<CR>')
keymap.set('n', '<C-l>', ':bn<CR>')
keymap.set('n', '<C-h>', ':bp<CR>')
keymap.set('n', '<CR>', ':b#<CR>')
-- Coc explorer
keymap.set('n', '<leader>e', ':CocCommand explorer<CR>')
-- Overwrite default
keymap.set('n', '<C-j>', 'i<CR><Esc>')
keymap.set('!', '<C-j>', '<Down>')
keymap.set('!', '<C-k>', '<Up>')
keymap.set('!', '<C-c>', '<Esc>')
keymap.set('', '<C-c>', '<Esc>')
keymap.set('n', 'Y', 'y$')
-- Center cursor
keymap.set('n', '<C-f>', '<C-f>M')
keymap.set('n', '<C-b>', '<C-b>M')
keymap.set('n', '=G', '=Gzz')
keymap.set('n', 'n', 'nzz')
keymap.set('n', 'N', 'Nzz')
