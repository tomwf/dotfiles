local bind = vim.keymap.set
local opts = { noremap = true, silent = true }
-- Leader key
vim.g.mapleader = " "
-- Diagnostic
bind("n", "<leader>dj", ":lua vim.diagnostic.goto_next()<CR>zz", opts)
bind("n", "<leader>dk", ":lua vim.diagnostic.goto_prev()<CR>zz", opts)
-- Git
bind("n", "<leader>gg", ":vertical Git<bar>%bd!<bar>b#<CR>", opts)
bind("n", "<leader>gb", ":BlamerToggle<CR>", opts)
bind("n", "<leader>gj", ":lua require('gitsigns').nav_hunk('next')<CR>zz", opts)
bind("n", "<leader>gk", ":lua require('gitsigns').nav_hunk('prev')<CR>zz", opts)
bind("n", "<leader>gd", ":Gvdiff<CR>", opts)
-- Buffer
bind("n", "<C-k>", ":bp|bd#<CR>", opts)
bind("n", "<C-l>", ":bn<CR>", opts)
bind("n", "<C-h>", ":bp<CR>", opts)
bind("n", "<CR>", ":b#<CR>", opts)
-- Explorer
bind("n", "<leader>e", ":Neotree float reveal toggle<CR>", opts)
-- Overwrite default
bind("n", "<C-j>", "i<CR><Esc>")
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
-- Debugger
bind("n", "<leader>do", ":lua require('dapui').toggle()<CR>", opts)
bind("n", "<leader>dr", ":lua require('dap').continue()<CR>", opts)
bind("n", "<leader>db", ":lua require('dap').toggle_breakpoint()<CR>", opts)
bind("n", "<leader>dn", ":lua require('dap').step_over()<CR>", opts)
bind("n", "<leader>di", ":lua require('dap').step_into()<CR>", opts)
