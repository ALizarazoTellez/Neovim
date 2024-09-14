-- Telescope.

return {
	"nvim-telescope/telescope.nvim",
	tag = "0.1.8",

	dependencies = { "nvim-lua/plenary.nvim" },

	keys = {
		{ "<Leader>f", desc = "Find files in Git" },
		{ "<Leader>s", desc = "Search content in files" },
	},

	config = function()
		local builtin = require("telescope.builtin")
		vim.keymap.set("n", "<Leader>f", builtin.git_files)
		vim.keymap.set("n", "<Leader>s", builtin.live_grep)
	end,
}
