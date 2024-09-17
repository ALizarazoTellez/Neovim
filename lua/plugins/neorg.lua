return {
	"nvim-neorg/neorg",

	keys = {
		{ "<LocalLeader><LocalLeader>", nil },
	},

	opts = {
		load = {
			["core.defaults"] = {},
			["core.concealer"] = {},
			["core.dirman"] = {
				config = {
					workspaces = {
						notes = "~/Documents/Notes",
					},
					default_workspace = "notes",
				},
			},
		},
	},

	config = function(_, opts)
		require("neorg").setup(opts)

		vim.keymap.set("n", "<LocalLeader><LocalLeader>", function()
			if vim.bo.filetype == "norg" then
				vim.cmd.Neorg("return")
				return
			end
			vim.cmd.Neorg("index")
		end, { desc = "Toggle Neorg workspace" })
	end,
}
