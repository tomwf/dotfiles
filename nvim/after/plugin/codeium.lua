local bind = vim.keymap.set
local opts = { noremap = true, silent = true }
-- Disable default keybindings
vim.g.codeium_disable_bindings = 1
-- Toggle autocompletion
bind("n", "<leader>co", ":Codeium Disable<CR>", opts)
bind("n", "<leader>cc", ":Codeium Enable<CR>", opts)
