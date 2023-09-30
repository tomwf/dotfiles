local lsp = require("lsp-zero")

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

require('mason').setup({})
require('mason-lspconfig').setup({
  ensure_installed = {},
  handlers = {
    lsp.default_setup,
  },
})
