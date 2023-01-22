require("tokyonight").setup({
	transparent = true, -- Enable this to disable setting the background color
	styles = {
		sidebars = "transparent", -- style for sidebars, see below
		floats = "transparent", -- style for floating windows
	},
})
vim.cmd([[colorscheme tokyonight]])
