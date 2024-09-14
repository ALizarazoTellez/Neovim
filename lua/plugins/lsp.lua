return {
	"neovim/nvim-lspconfig",

	dependencies = {
		{ "hrsh7th/cmp-nvim-lsp" },
		{ "hrsh7th/nvim-cmp" },
	},

	config = function()
		local lspconfig = require("lspconfig")

		-- Add cmp_nvim_lsp capabilities settings to lspconfig.
		lspconfig.util.default_config.capabilities = vim.tbl_deep_extend(
			"force",
			lspconfig.util.default_config.capabilities,
			require("cmp_nvim_lsp").default_capabilities()
		)

		-- Executes the callback function every time a
		-- language server is attached to a buffer.
		vim.api.nvim_create_autocmd("LspAttach", {
			desc = "LSP actions",
			callback = function(event)
				local opts = { buffer = event.buf }

				vim.keymap.set("n", "<Leader>a", "<cmd>lua vim.lsp.buf.code_action()<cr>", opts)
				vim.keymap.set("n", "<Leader>h", "<cmd>lua vim.lsp.buf.hover()<cr>", opts)
				vim.keymap.set("n", "<Leader>r", "<cmd>lua vim.lsp.buf.rename()<cr>", opts)
				vim.keymap.set({ "n", "x" }, "<Leader>f", "<cmd>lua vim.lsp.buf.format({async = true})<cr>", opts)
				vim.keymap.set("n", "gd", "<cmd>lua vim.lsp.buf.definition()<cr>", opts)
				vim.keymap.set("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<cr>", opts)
				vim.keymap.set("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<cr>", opts)
				vim.keymap.set("n", "go", "<cmd>lua vim.lsp.buf.type_definition()<cr>", opts)
				vim.keymap.set("n", "gr", "<cmd>lua vim.lsp.buf.references()<cr>", opts)
				vim.keymap.set("n", "gs", "<cmd>lua vim.lsp.buf.signature_help()<cr>", opts)
			end,
		})

		lspconfig.lua_ls.setup({})
		lspconfig.gopls.setup({})

		---
		-- Autocompletion setup
		---
		local cmp = require("cmp")

		cmp.setup({
			sources = {
				{ name = "nvim_lsp" },
			},
			snippet = {
				expand = function(args)
					vim.snippet.expand(args.body)
				end,
			},
			mapping = cmp.mapping.preset.insert({
				["<C-b>"] = cmp.mapping.scroll_docs(-3),
				["<C-f>"] = cmp.mapping.scroll_docs(3),
				["<C-Space>"] = cmp.mapping.complete(),
				["<C-e>"] = cmp.mapping.abort(),
				["<Enter>"] = cmp.mapping.confirm({ select = true }),
			}),
		})
	end,
}
