return {
	{
		-- Color picker
		"uga-rosa/ccc.nvim",
		lazy = true,
		opts = {},
	},
	{
		"catgoose/nvim-colorizer.lua",
		event = "VeryLazy",
		opts = {
			lazy_load = true,
			-- other setup options
		},
	},
	{
		"mistricky/codesnap.nvim",
		lazy = true,
		build = "make",
		keys = {
			{ "<leader>cc", "<cmd>CodeSnap<cr>", mode = "x", desc = "Save selected code snapshot into clipboard" },
			{ "<leader>cs", "<cmd>CodeSnapSave<cr>", mode = "x", desc = "Save selected code snapshot in ~/Pictures" },
		},
		opts = {
			save_path = "~/Pictures",
			has_breadcrumbs = true,
			bg_theme = "bamboo",
		},
	},
}
