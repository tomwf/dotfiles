local builtin = require("telescope.builtin")
vim.keymap.set("n", "<leader>fh", builtin.current_buffer_fuzzy_find, {})
vim.keymap.set("n", "<leader>fo", builtin.find_files, {})
vim.keymap.set("n", "<leader>ff", builtin.live_grep, {})
vim.keymap.set("n", "<leader>fb", builtin.buffers, {})
vim.keymap.set("n", "<leader>fd", builtin.help_tags, {})

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
