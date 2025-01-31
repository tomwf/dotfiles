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
bind("n", "<leader>gw", "<Cmd>BlamerToggle<CR>", opts)
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
-- Debugger
bind("n", "<leader>dh", "<Cmd>lua require('dap').toggle_breakpoint()<CR>", opts)
bind("n", "<leader>dc", "<Cmd>lua require('dap').continue()<CR>", opts)
bind("n", "<leader>dn", "<Cmd>lua require('dap').step_over()<CR>", opts)
bind("n", "<leader>di", "<Cmd>lua require('dap').step_into()<CR>", opts)
bind("n", "<leader>do", "<Cmd>lua require('dap').step_out()<CR>", opts)
bind("n", "<leader>db", "<Cmd>lua require('dap').step_back()<CR>", opts)
bind("n", "<leader>dq", "<Cmd>lua require('dap').terminate()<CR>", opts)
bind("n", "<leader>de", "<Cmd>lua require('dapui').eval()<CR>", opts)
bind("n", "<leader>dt", "<Cmd>lua require('dapui').toggle()<CR>", opts)
