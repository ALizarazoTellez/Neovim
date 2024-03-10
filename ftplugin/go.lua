-- Go Filetype Plugin.

local lspconfig = require("lspconfig")
local capabilities = require("cmp_nvim_lsp").default_capabilities()

lspconfig.gopls.setup({
	capabilities = capabilities,
})
