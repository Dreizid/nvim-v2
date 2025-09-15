return {
	{
		"folke/noice.nvim",
		event = "VeryLazy",
		dependencies = {
			-- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
			"MunifTanjim/nui.nvim",
			-- OPTIONAL:
			--   `nvim-notify` is only needed, if you want to use the notification view.
			--   If not available, we use `mini` as the fallback
			"rcarriga/nvim-notify",
		},
		opts = {
			lsp = {
				-- override markdown rendering so that **cmp** and other plugins use **Treesitter**
				override = {
					["vim.lsp.util.convert_input_to_markdown_lines"] = true,
					["vim.lsp.util.stylize_markdown"] = true,
				},
			},
		},
	},
	{
		"sphamba/smear-cursor.nvim",
		opts = {
			stiffness = 0.8, -- 0.6      [0, 1]
			trailing_stiffness = 0.6, -- 0.45     [0, 1]
			stiffness_insert_mode = 0.7, -- 0.5      [0, 1]
			trailing_stiffness_insert_mode = 0.7, -- 0.5      [0, 1]
			damping = 0.95, -- 0.85     [0, 1]
			damping_insert_mode = 0.95, -- 0.9      [0, 1]
			distance_stop_animating = 0.5, -- 0.1      > 0
		},
	},
}
