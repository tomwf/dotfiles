local builtin = require("telescope.builtin")
-- Files
vim.keymap.set("n", "<leader>fo", builtin.find_files, {})
vim.keymap.set("n", "<leader>ff", builtin.live_grep, {})
vim.keymap.set("n", "<leader>fs", builtin.grep_string, {})
-- Vim
vim.keymap.set("n", "<leader>fh", builtin.current_buffer_fuzzy_find, {})
vim.keymap.set("n", "<leader>fb", builtin.buffers, {})
vim.keymap.set("n", "<leader>f:", builtin.command_history, {})
vim.keymap.set("n", "<leader>f/", builtin.search_history, {})
vim.keymap.set("n", '<leader>f"', builtin.registers, {})
-- LSP
vim.keymap.set("n", "<leader>fr", builtin.lsp_references, {})
vim.keymap.set("n", "<leader>fd", builtin.lsp_document_symbols, {})
vim.keymap.set("n", "<leader>fw", builtin.diagnostics, {})
-- Git
vim.keymap.set("n", "<leader>gs", builtin.git_status, {})
vim.keymap.set("n", "<leader>gb", builtin.git_branches, {})
vim.keymap.set("n", "<leader>gl", builtin.git_commits, {})
vim.keymap.set("n", "<leader>gf", builtin.git_bcommits, {})
-- Treesitter
vim.keymap.set("n", "<leader>ft", builtin.treesitter, {})
-- Emoji
vim.keymap.set("n", "<leader>fe", "<Cmd>Telescope emoji<CR>", {})

local actions = require("telescope.actions")
require("telescope").setup({
	defaults = {
		mappings = {
			i = {
				["<C-j>"] = actions.move_selection_next,
				["<C-k>"] = actions.move_selection_previous,
				["<C-v>"] = actions.send_selected_to_qflist + actions.open_qflist,
				["<C-f>"] = actions.results_scrolling_down,
				["<C-b>"] = actions.results_scrolling_up,
			},
		},
	},
})

require("telescope").load_extension("emoji")
