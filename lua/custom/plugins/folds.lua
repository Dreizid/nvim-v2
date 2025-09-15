return {
	{
		"chrisgrieser/nvim-origami",
		event = "VeryLazy",
		opts = {
			foldKeymaps = {
				setup = false,
			},
		}, -- needed even when using default config
		keys = {
			{
				"<Left>",
				function()
					require("origami").h()
				end,
				{ desc = "Close fold" },
			},
			{
				"<Right>",
				function()
					require("origami").l()
				end,
				{ desc = "Close fold" },
			},
		},

		-- recommended: disable vim's auto-folding
		init = function()
			vim.opt.foldlevel = 99
			vim.opt.foldlevelstart = 99
		end,
	},
}
