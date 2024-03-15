return {
	"nvim-telescope/telescope.nvim",
	tag = "0.1.5",
	dependencies = {
		"nvim-lua/plenary.nvim",
	},

	cmd = "Telescope",

	keys = {
		{ "<Leader>ts", nil, desc = "Search for string in the current working directory" },
		{ "<Leader>tw", nil, desc = "Search for word in the current working directory" },
	},

	config = function()
		local builtin = require("telescope.builtin")

		vim.keymap.set("n", "<Leader>ts", builtin.live_grep, {})
		vim.keymap.set("n", "<Leader>tw", builtin.grep_string, {})
	end,
}
