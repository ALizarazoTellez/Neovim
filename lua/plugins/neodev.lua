return {
	"folke/neodev.nvim",

	opts = {},

	config = function(_, opts)
		require("neodev").setup(opts)

		local capabilities = require("cmp_nvim_lsp").default_capabilities()

		require("lspconfig").lua_ls.setup({
			settings = {
				Lua = {
					completion = {
						callSnippet = "Replace",
					},
				},
			},

			capabilities = capabilities,
		})
	end,
}
