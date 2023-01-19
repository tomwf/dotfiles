local lsp = require("lsp-zero")
lsp.preset("recommended")

lsp.set_preferences({
	set_lsp_keymaps = false,
})

lsp.on_attach(function(client, bufnr)
	local opts = { buffer = bufnr, remap = false }
	local bind = vim.keymap.set

	bind("n", "gd", vim.lsp.buf.definition, opts)
	bind("n", "K", vim.lsp.buf.hover, opts)
	bind("n", "<leader>z", vim.lsp.buf.type_definition, opts)
	bind("n", "<leader>r", vim.lsp.buf.rename, opts)
	bind("n", "gr", vim.lsp.buf.references, opts)
	bind("n", "<leader>lf", function()
		vim.lsp.buf.format({ async = true })
	end, opts)
end)

-- Configure lua language server for neovim
lsp.nvim_workspace()

lsp.setup()
