-- Zig filetype plugin.

require("lspconfig").zls.setup({
	capabilities = require("cmp_nvim_lsp").default_capabilities(),
})

vim.cmd.LspStart()