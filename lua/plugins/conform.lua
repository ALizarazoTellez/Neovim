-- Formatter.

return {
	"stevearc/conform.nvim",

	opts = {
		formatters_by_ft = {
			c = { "clang-format" },
			css = { "prettierd", "prettier", stop_after_first = true },
			fish = { "fish_indent" },
			go = { "gofumpt" },
			html = { "prettierd", "prettier", stop_after_first = true },
			javascript = { "prettierd", "prettier", stop_after_first = true },
			lua = { "stylua" },
			typescript = { "prettierd", "prettier", stop_after_first = true },
			typescriptreact = { "prettierd", "prettier", stop_after_first = true },
		},
		format_on_save = {
			timeout_ms = 500,
			lsp_format = "fallback",
		},
	},
}
