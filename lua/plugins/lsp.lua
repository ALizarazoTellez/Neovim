return {
	"neovim/nvim-lspconfig",

	config = function()
		-- Executes the callback function every time a
		-- language server is attached to a buffer.
		vim.api.nvim_create_autocmd("LspAttach", {
			desc = "LSP actions",
			callback = function(event)
				local opts = { buffer = event.buf }

				vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
				vim.keymap.set("n", "<Leader>d", vim.diagnostic.open_float, opts)
				vim.keymap.set("n", "<Leader>r", vim.lsp.buf.rename, opts)

				vim.keymap.set({ "n", "x" }, "<Leader>f", function()
					vim.lsp.buf.format({ async = true })
				end, opts)
			end,
		})
	end,
}
