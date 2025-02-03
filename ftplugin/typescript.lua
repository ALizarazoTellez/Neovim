-- TypeScript filetype plugin.

-- Show tab characters as 3 spaces.
vim.opt_local.tabstop = 3
vim.opt_local.softtabstop = 0

-- Use <Tab> to indent with 2 space characters.
vim.opt_local.shiftwidth = 2
vim.opt_local.expandtab = true

require("lspconfig").ts_ls.setup({})

vim.cmd.LspStart()
