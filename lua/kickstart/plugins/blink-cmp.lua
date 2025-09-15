-- Autocompletion
-- Another option would be coq.nvim https://github.com/ms-jpq/coq_nvim?tab=readme-ov-file
-- blink.cmp docs
-- https://cmp.saghen.dev/
return {
	{
		"saghen/blink.cmp",
		event = "InsertEnter",
		version = "1.*",
		dependencies = {
			-- Snippet Engine
			{
				"L3MON4D3/LuaSnip",
				version = "2.*",
				build = (function()
					-- Build Step is needed for regex support in snippets.
					-- This step is not supported in many windows environments.
					-- Remove the below condition to re-enable on windows.
					if vim.fn.has("win32") == 1 or vim.fn.executable("make") == 0 then
						return
					end
					return "make install_jsregexp"
				end)(),
				dependencies = {
					-- `friendly-snippets` contains a variety of premade snippets.
					--    See the README about individual language/framework/plugin snippets:
					--    https://github.com/rafamadriz/friendly-snippets
					{
						"rafamadriz/friendly-snippets",
						config = function()
							require("luasnip.loaders.from_vscode").lazy_load()
						end,
					},
				},
				opts = {},
			},
			{
				-- https://github.com/onsails/lspkind.nvim
				-- Provides vscode like icons for kind
				"onsails/lspkind.nvim",
				opts = {
					symbol_map = {
						spell = "󰓆",
						cmdline = "",
						markdown = "",
					},
				},
			},
			"folke/lazydev.nvim",
			-- https://github.com/nvim-tree/nvim-web-devicons
			-- Provides icons for kind
			"nvim-tree/nvim-web-devicons",
			-- Provides completion for conventional git commits
			"disrupted/blink-cmp-conventional-commits",
		},

		--- @module 'blink.cmp'
		--- @type blink.cmp.Config
		opts = {
			keymap = {
				preset = "super-tab",
				-- For more advanced Luasnip keymaps (e.g. selecting choice nodes, expansion) see:
				--    https://github.com/L3MON4D3/LuaSnip?tab=readme-ov-file#keymaps
			},
			appearance = {
				nerd_font_variant = "mono",
			},
			completion = {
				-- By default, you may press `<c-space>` to show the documentation.
				-- Optionally, set `auto_show = true` to show the documentation after a delay.
				documentation = { auto_show = true, window = { border = "single" } },
				ghost_text = { enabled = true },
				menu = {
					border = "single",
					draw = {
						columns = {
							{ "kind_icon" },
							{ "label", "label_description", gap = 1 },
							components = {
								kind_icon = {
									text = function(ctx)
										local icon = ctx.kind_icon
										if vim.tbl_contains({ "Path" }, ctx.source_name) then
											local dev_icon, _ = require("nvim-web-devicons").get_icon(ctx.label)
											if dev_icon then
												icon = dev_icon
											end
										else
											icon = require("lspkind").symbolic(ctx.kind, {
												mode = "symbol",
											}) or ctx.kind_icon
										end

										return icon .. ctx.icon_gap
									end,
								},
							},
						},
					},
				},
			},

			sources = {
				default = { "lsp", "path", "snippets", "lazydev" },

				per_filetype = {
					gitcommit = { "conventional_commits", "buffer", "path" },
				},

				providers = {
					lazydev = {
						name = "Lazy Dev",
						module = "lazydev.integrations.blink",
						score_offset = 100,
					},
					conventional_commits = {
						name = "Conventional Commits",
						module = "blink-cmp-conventional-commits",
						enabled = function()
							return vim.bo.filetype == "gitcommit"
						end,
						---@module 'blink-cmp-conventional-commits'
						---@type blink-cmp-conventional-commits.Options
						opts = {},
					},
				},
			},

			snippets = { preset = "luasnip" },

			-- Blink.cmp includes an optional, recommended rust fuzzy matcher,
			-- which automatically downloads a prebuilt binary when enabled.
			--
			-- By default, we use the Lua implementation instead, but you may enable
			-- the rust implementation via `'prefer_rust_with_warning'`
			--
			-- See :h blink-cmp-config-fuzzy for more information
			fuzzy = { implementation = "prefer_rust_with_warning" },

			-- Shows a signature help window while you type arguments for a function
			signature = { enabled = true },
			-- Make the command line completion autoshow by default
			cmdline = {
				keymap = { preset = "inherit" },
				completion = { menu = { auto_show = true } },
			},
		},
	},
}
-- vim: ts=2 sts=2 sw=2 et
