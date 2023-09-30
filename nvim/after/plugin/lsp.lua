local lsp = require("lsp-zero")

lsp.on_attach(function(client, bufnr)
	local opts = { buffer = bufnr, remap = false }
	local bind = vim.keymap.set
  lsp.default_keymaps({buffer = bufnr})

	bind("n", "<leader>rn", vim.lsp.buf.rename, opts)
	bind("n", "<leader>rf", vim.lsp.buf.format, opts)
	bind("n", "<leader>ra", vim.lsp.buf.code_action, opts)
end)

require('mason').setup({})
require('mason-lspconfig').setup({
  ensure_installed = {},
  handlers = {
    lsp.default_setup,
  },
})
