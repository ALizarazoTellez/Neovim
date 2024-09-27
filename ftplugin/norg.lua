-- Neorg filetype plugin.

-- Options.
vim.opt_local.conceallevel = 2
vim.opt_local.concealcursor = "c"
vim.opt_local.fillchars = { eob = " " }

-- Keymaps.
vim.api.nvim_set_keymap("n", "<LocalLeader>i", "<Cmd>Neorg index<Enter>", { desc = "Go to Norg Index" })
vim.api.nvim_set_keymap("n", "<Leader>f", "m'gg=G''", { desc = "Indent Norg File" })
