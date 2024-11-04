local bind = vim.keymap.set
local opts = { noremap = true, silent = true }
-- Leader key
vim.g.mapleader = " "
-- Diagnostic
bind("n", "<leader>dj", "<Cmd>lua vim.diagnostic.goto_next()<CR>zz", opts)
bind("n", "<leader>dk", "<Cmd>lua vim.diagnostic.goto_prev()<CR>zz", opts)
bind("n", "<leader>dd", "<Cmd>lua vim.diagnostic.open_float()<CR>", opts)
-- Git
bind("n", "<leader>gg", "<Cmd>vertical Git<bar>%bd!<bar>b#<CR>", opts)
bind("n", "<leader>gb", "<Cmd>BlamerToggle<CR>", opts)
bind("n", "<leader>gj", "<Cmd>lua require('gitsigns').nav_hunk('next')<CR>zz", opts)
bind("n", "<leader>gk", "<Cmd>lua require('gitsigns').nav_hunk('prev')<CR>zz", opts)
bind("n", "<leader>gd", "<Cmd>Gvdiff<CR>", opts)
bind("n", "<leader>gh", "<Cmd>DiffviewFileHistory<CR>", opts)
bind("n", "<leader>gf", "<Cmd>DiffviewFileHistory %<CR>", opts)
-- Buffer
bind("n", "<C-j>", "<Cmd>BufferMoveStart<CR>", opts)
bind("n", "<C-k>", "<Cmd>bp|bd#<CR>", opts)
bind("n", "<C-l>", "<Cmd>BufferNext<CR>", opts)
bind("n", "<C-h>", "<Cmd>BufferPrevious<CR>", opts)
bind("n", "<CR>", "<Cmd>b#<CR>", opts)
-- Explorer
bind("n", "<leader>e", "<Cmd>Neotree float reveal toggle<CR>", opts)
-- Overwrite default
bind("!", "<C-j>", "<Down>")
bind("!", "<C-k>", "<Up>")
bind("!", "<C-c>", "<Esc>")
bind("", "<C-c>", "<Esc>")
bind("n", "Y", "y$")
-- Center cursor
bind("n", "<C-f>", "<C-f>Mzz")
bind("n", "<C-b>", "<C-b>Mzz")
bind("n", "=G", "=Gzz")
bind("n", "n", "nzz")
bind("n", "N", "Nzz")
