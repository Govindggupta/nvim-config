return {
	"stevearc/conform.nvim",
	opts = {
		-- format_on_save = {
		-- 	timeout_ms = 1000,
		-- 	lsp_fallback = true,
		-- },

		formatters_by_ft = {
			lua = { "stylua" },
			javascript = { "prettierd" },
			typescript = { "prettierd" },
			javascriptreact = { "prettierd" },
			typescriptreact = { "prettierd" },
			html = { "prettierd" },
			css = { "prettierd" },
			json = { "prettierd" },
			c = { "clang_format" },
			cpp = { "clang_format" },
			python = { "ruff_format" },
		},
	},
}
