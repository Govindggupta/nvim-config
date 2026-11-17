-- Standalone plugins with less than 10 lines of config go here
return {
	{
		-- autoclose/rename html tags
		"windwp/nvim-ts-autotag",
		event = "InsertEnter",
		opts = {
			opts = {
				enable_close = true,
				enable_rename = true,
				enable_close_on_slash = false,
			},
		},
		config = function(_, opts)
			require("nvim-ts-autotag").setup(opts)
		end,
	},
	{
		-- detect tabstop and shiftwidth automatically
		"tpope/vim-sleuth",
	},
	{
		-- Hints keybinds
		"folke/which-key.nvim",
		opts = {
			delay = 3000,
			-- win = {
			--   border = {
			--     { '┌', 'FloatBorder' },
			--     { '─', 'FloatBorder' },
			--     { '┐', 'FloatBorder' },
			--     { '│', 'FloatBorder' },
			--     { '┘', 'FloatBorder' },
			--     { '─', 'FloatBorder' },
			--     { '└', 'FloatBorder' },
			--     { '│', 'FloatBorder' },
			--   },
			-- },
		},
	},
	{
		-- Autoclose parentheses, brackets, quotes, etc.
		"windwp/nvim-autopairs",
		event = "InsertEnter",
		config = true,
		opts = {},
	},
	{
		-- Highlight todo, notes, etc in comments
		"folke/todo-comments.nvim",
		event = "VimEnter",
		dependencies = { "nvim-lua/plenary.nvim" },
		opts = { signs = false },
	},
	{
		"brenoprata10/nvim-highlight-colors",
		config = function()
			require("nvim-highlight-colors").setup({
				render = "virtual",
				virtual_symbol = "󱓻",
				virtual_symbol_position = "inline",
				enable_tailwind = true,
			})
		end,
	},
}
