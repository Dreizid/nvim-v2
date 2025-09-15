return {
	{
		"CopilotC-Nvim/CopilotChat.nvim",
		lazy = true,
		dependencies = {
			{ "nvim-lua/plenary.nvim", branch = "master" },
		},
		build = "make tiktoken",
		opts = {
			-- See Configuration section for options
		},
	},
}
