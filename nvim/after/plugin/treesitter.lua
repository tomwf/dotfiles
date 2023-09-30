require("nvim-treesitter.configs").setup({
	ensure_installed = { "javascript", "typescript", "c", "lua" },
	-- Install parsers synchronously (only applied to `ensure_installed`)
	sync_install = false,
	highlight = {
		enable = true,
		additional_vim_regex_highlighting = false,
	},
})
