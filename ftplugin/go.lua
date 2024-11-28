-- Go filetype plugin.

vim.opt_local.expandtab = false
vim.opt_local.shiftwidth = 6

require("lspconfig").gopls.setup({
	settings = {
		gopls = {
			gofumpt = true,
		},
	},
})

vim.cmd.LspStart()
