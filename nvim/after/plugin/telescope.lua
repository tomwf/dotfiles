local builtin = require("telescope.builtin")
-- Files
vim.keymap.set("n", "<leader>fo", builtin.find_files, {})
vim.keymap.set("n", "<leader>ff", "<Cmd>lua require('telescope').extensions.live_grep_args.live_grep_args()<CR>", {})
vim.keymap.set("n", "<leader>fs", builtin.grep_string, {})
vim.keymap.set("n", "<leader>fl", builtin.oldfiles, {})
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
-- File Browser
vim.keymap.set("n", "<leader>e", "<Cmd>Telescope file_browser path=%:p:h select_buffer=true<CR>")

local telescope = require("telescope")
local actions = require("telescope.actions")

telescope.setup({
	defaults = {
		mappings = {
			i = {
				["<C-j>"] = actions.move_selection_next,
				["<C-k>"] = actions.move_selection_previous,
				["<C-v>"] = actions.send_selected_to_qflist + actions.open_qflist,
				["<C-f>"] = actions.results_scrolling_down,
				["<C-b>"] = actions.results_scrolling_up,
				["<C-a>"] = actions.send_to_qflist + actions.open_qflist,
			},
		},
	},
})

telescope.load_extension("emoji")
telescope.load_extension("live_grep_args")
