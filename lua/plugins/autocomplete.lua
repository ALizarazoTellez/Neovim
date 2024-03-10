return {
	"hrsh7th/nvim-cmp",
	dependencies = {
		"hrsh7th/cmp-nvim-lsp",
		"hrsh7th/cmp-buffer",
		"hrsh7th/cmp-path",
		"hrsh7th/cmp-cmdline",
		{
			"dcampos/cmp-snippy",
			dependencies = { "dcampos/nvim-snippy" },
		},
	},

	config = function(_, _)
		local cmp = require("cmp")
		local snippy = require("snippy")

		local select_opts = { behavior = cmp.SelectBehavior.Select }

		cmp.setup({
			snippet = {
				expand = function(args)
					require("snippy").expand_snippet(args.body)
				end,
			},

			window = {
				completion = cmp.config.window.bordered(),
				documentation = cmp.config.window.bordered(),
			},

			formatting = {
				fields = { "menu", "abbr", "kind" },
				format = function(entry, item)
					local menu_icon = {
						nvim_lsp = "λ",
						snippy = "⋗",
						buffer = "Ω",
						path = "🖫",
					}

					item.menu = menu_icon[entry.source.name]

					return item
				end,
			},

			mapping = {
				-- Move between completion items.
				["<Up>"] = cmp.mapping.select_prev_item(select_opts),
				["<Down>"] = cmp.mapping.select_next_item(select_opts),

				["<C-p>"] = cmp.mapping.select_prev_item(select_opts),
				["<C-n>"] = cmp.mapping.select_next_item(select_opts),

				-- Scroll text in the documentation window.
				["<C-u>"] = cmp.mapping.scroll_docs(-4),
				["<C-d>"] = cmp.mapping.scroll_docs(4),

				-- Cancel completion.
				["<C-e>"] = cmp.mapping.abort(),

				-- Confirm selection.
				["<C-y>"] = cmp.mapping.confirm({ select = true }),
				["<CR>"] = cmp.mapping.confirm({ select = false }),

				-- Jump to the next placeholder in the snippet.
				["<C-f>"] = cmp.mapping(function(fallback)
					if snippy.can_jump(1) then
						snippy.next()
					else
						fallback()
					end
				end, { "i", "s" }),

				-- Jump to the previous placeholder in the snippet.
				["<C-b>"] = cmp.mapping(function(fallback)
					if snippy.can_jump(-1) then
						snippy.previous()
					else
						fallback()
					end
				end, { "i", "s" }),

				-- If the completion menu is visible, move to the next item. If
				-- the line is "empty", insert a Tab character. If the cursor is
				-- inside a word, trigger the completion menu.
				["<Tab>"] = cmp.mapping(function(fallback)
					local col = vim.fn.col(".") - 1

					if cmp.visible() then
						cmp.select_next_item(select_opts)
					elseif col == 0 or vim.fn.getline("."):sub(col, col):match("%s") then
						fallback()
					else
						cmp.complete()
					end
				end, { "i", "s" }),

				-- If the completion menu is visible, move to the previous item.
				["<S-Tab>"] = cmp.mapping(function(fallback)
					if cmp.visible() then
						cmp.select_prev_item(select_opts)
					else
						fallback()
					end
				end, { "i", "s" }),
			},

			sources = cmp.config.sources({
				{ name = "path" },
				{ name = "nvim_lsp", keyword_length = 1 },
				{ name = "buffer", keyword_length = 3 },
				{ name = "snippy", keyword_length = 2 },
			}),
		})

		-- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
		cmp.setup.cmdline({ "/", "?" }, {
			mapping = cmp.mapping.preset.cmdline(),
			sources = {
				{ name = "buffer" },
			},
		})

		-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
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
