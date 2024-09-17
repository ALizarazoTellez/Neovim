-- Neovim terminal configuration.

vim.keymap.set("t", "<C-,>", "<C-\\><C-n>", { desc = "Exit focused terminal" })

vim.api.nvim_create_autocmd("TermOpen", {
	pattern = "*",
	callback = function()
		vim.opt_local.number = false
		vim.opt_local.relativenumber = false
	end,
})
