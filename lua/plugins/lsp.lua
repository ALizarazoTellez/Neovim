return {
	"neovim/nvim-lspconfig",

	dependencies = {
		"williamboman/mason.nvim",
		"williamboman/mason-lspconfig.nvim",
	},

	cmd = "LspInstall",

	config = function()
		-- Configure mason.
		require("mason").setup()
		require("mason-lspconfig").setup()

		-- Executes the callback function every time a
		-- language server is attached to a buffer.
		vim.api.nvim_create_autocmd("LspAttach", {
			desc = "LSP actions",
			callback = function(event)
				local opts = { buffer = event.buf }

				vim.keymap.set("n", "<Leader>a", "<Cmd>lua vim.lsp.buf.code_action()<Enter>", opts)
				vim.keymap.set("n", "<Leader>d", "<Cmd>lua vim.diagnostic.open_float()<Enter>", opts)
				vim.keymap.set("n", "<Leader>h", "<Cmd>lua vim.lsp.buf.hover()<Enter>", opts)
				vim.keymap.set("n", "<Leader>r", "<Cmd>lua vim.lsp.buf.rename()<Enter>", opts)
				vim.keymap.set({ "n", "x" }, "<Leader>f", "<Cmd>lua vim.lsp.buf.format({async = true})<Enter>", opts)
				vim.keymap.set("n", "gD", "<Cmd>lua vim.lsp.buf.declaration()<Enter>", opts)
				vim.keymap.set("n", "gd", "<Cmd>lua vim.lsp.buf.definition()<Enter>", opts)
				vim.keymap.set("n", "gi", "<Cmd>lua vim.lsp.buf.implementation()<Enter>", opts)
				vim.keymap.set("n", "go", "<Cmd>lua vim.lsp.buf.type_definition()<Enter>", opts)
				vim.keymap.set("n", "gr", "<Cmd>lua vim.lsp.buf.references()<Enter>", opts)
				vim.keymap.set("n", "gs", "<Cmd>lua vim.lsp.buf.signature_help()<Enter>", opts)
			end,
		})
	end,
}
