return {
	"mbbill/undotree",

	cmd = "UndotreeToggle",

	keys = {
		{ "<Leader>u", vim.cmd.UndotreeToggle, desc = "Toggle undotree" },
	},

	config = function()
		vim.g.undotree_SetFocusWhenToggle = 1
		vim.g.undotree_DiffpanelHeight = 0
	end,
}
