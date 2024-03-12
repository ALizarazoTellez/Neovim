return {
	"nvim-telescope/telescope.nvim",
	tag = "0.1.5",
	dependencies = {
		"nvim-lua/plenary.nvim",
	},

	cmd = "Telescope",

	keys = {
		{ "<Leader>fg", nil, desc = "Search for string in the current working directory" },
	},

	config = function()
		local builtin = require("telescope.builtin")

		vim.keymap.set("n", "<Leader>fg", builtin.live_grep, {})
	end,
}
