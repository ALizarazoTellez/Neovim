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
