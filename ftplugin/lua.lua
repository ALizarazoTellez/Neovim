-- Lua filetype plugin.

require("lspconfig").lua_ls.setup({
	capabilities = require("cmp_nvim_lsp").default_capabilities(),
})

-- LspStart is done by Lazydev.
