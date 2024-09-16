-- CSS filetype plugin.

local lspconfig = require("lspconfig")

local capabilities = require("cmp_nvim_lsp").default_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

lspconfig.cssls.setup({
	capabilities = capabilities,
})

lspconfig.emmet_language_server.setup({})

vim.cmd.LspStart()
