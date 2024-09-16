-- Telescope.

return {
	"nvim-telescope/telescope.nvim",
	tag = "0.1.8",

	dependencies = { "nvim-lua/plenary.nvim" },

	keys = {
		{ "<Leader>g", desc = "Go to file" },
		{ "<Leader>s", desc = "Search content in files" },
	},

	config = function()
		local builtin = require("telescope.builtin")
		vim.keymap.set("n", "<Leader>g", builtin.find_files)
		vim.keymap.set("n", "<Leader>s", builtin.live_grep)
	end,
}
