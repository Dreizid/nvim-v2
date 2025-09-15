return {
	{
		-- Hover Utilities
		-- Provides utilities like fold preview, github issues, lsp, etc.
		"lewis6991/hover.nvim",
		opts = {
			-- List of module names to load as providers
			--- @type (string|Hover.Config.Provider)[]
			providers = {
				"hover.providers.lsp",
				"hover.providers.fold_preview",
				"hover.providers.gh",
				-- "hover.providers.dictionary",
			},
		},
		keys = {
			{
				"K",
				function()
					require("hover").open()
				end,
				{ desc = "Hover Open" },
			},
			{
				"gK",
				function()
					require("hover").enter()
				end,
				{ desc = "Hover Enter" },
			},
		},
	},
	{
		-- Clipboard manager within neovim
		"AckslD/nvim-neoclip.lua",
		dependencies = {
			{ "nvim-telescope/telescope.nvim" },
		},
		opts = {
			history = 10,
			default_register = { '"', "+" },
		},
		keys = {
			{
				"<leader>p",
				"<CMD>Telescope neoclip<CR>",
				{ desc = "Neoclip history" },
			},
		},
	},
	{
		"chrisgrieser/nvim-various-textobjs",
		event = "VeryLazy",
		opts = {
			keymaps = {
				useDefaults = true,
			},
		},
	},
	{
		"sontungexpt/url-open",
		event = "VeryLazy",
		cmd = "URLOpenUnderCursor",
		config = function()
			local status_ok, url_open = pcall(require, "url-open")
			if not status_ok then
				return
			end
			url_open.setup({})
		end,
	},
}
