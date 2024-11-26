-- Copyright (C) Anderson Lizarazo Tellez.
-- My Neovim configuration.

require("options")
require("plugin-manager")

require("terminal")

-- Minimalist diagnostics.
vim.diagnostic.config({
	underline = false,
	virtual_text = false,
	severity_sort = true,

	float = {
		source = "if_many",
	},
})

-- Mappings.
vim.keymap.set("v", "<Leader>y", '"+y')
vim.keymap.set("n", "<Leader>y", 'V"+y')
vim.keymap.set("n", "<Leader>p", '"+p')
