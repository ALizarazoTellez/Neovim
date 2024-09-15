return {
	"hrsh7th/nvim-cmp",

	dependencies = {
		{ "hrsh7th/cmp-nvim-lsp" }, -- Also used in filetype plugins.
		{ "hrsh7th/cmp-buffer" },
		{ "hrsh7th/cmp-cmdline" },
		{ "hrsh7th/cmp-path" },
	},

	config = function()
		local cmp = require("cmp")

		local has_words_before = function()
			unpack = unpack or table.unpack
			local line, col = unpack(vim.api.nvim_win_get_cursor(0))
			return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
		end

		cmp.setup({
			sources = {
				{ name = "nvim_lsp" },
			},
			snippet = {
				expand = function(args)
					vim.snippet.expand(args.body)
				end,
			},

			mapping = cmp.mapping.preset.insert({
				["<C-b>"] = cmp.mapping.scroll_docs(-3),
				["<C-f>"] = cmp.mapping.scroll_docs(3),

				["<C-e>"] = cmp.mapping.abort(),
				["<Tab>"] = cmp.mapping(function(fallback)
					if cmp.visible() then
						if #cmp.get_entries() == 1 then
							cmp.confirm({ select = true })
						else
							cmp.select_next_item()
						end
					elseif has_words_before() then
						cmp.complete()
						if #cmp.get_entries() == 1 then
							cmp.confirm({ select = true })
						end
					else
						fallback()
					end
				end, { "i", "s" }),
			}),
		})

		cmp.setup.cmdline({ "/", "?" }, {
			mapping = cmp.mapping.preset.cmdline(),
			sources = {
				{ name = "buffer" },
			},
		})

		cmp.setup.cmdline(":", {
			mapping = cmp.mapping.preset.cmdline(),
			sources = cmp.config.sources({
				{ name = "path" },
			}, {
				{ name = "cmdline" },
			}),
		})
	end,
}
