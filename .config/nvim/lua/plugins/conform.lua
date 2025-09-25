return {
	"stevearc/conform.nvim",
	event = "BufWritePre",
	dependencies = { "williamboman/mason.nvim" },
	config = function()
		require("conform").setup({
			formatters_by_ft = {
				sh = { "beautysh" },
				bash = { "beautysh" },
				zsh = { "beautysh" },
				lua = { "stylua" },
				html = { "prettierd", "prettier", stop_after_first = true },
				css = { "prettierd", "prettier", stop_after_first = true },
				python = { "black", "autoflake", stop_after_first = true },
				c = { "clang-format" },
				cpp = { "clang-format" },
				cs = { "csharpier", "clang-format", stop_after_first = true },
				java = { "google-java-format", "clang-format", stop_after_first = true },
				javascript = { "prettierd", "prettier", "clang-format", stop_after_first = true },
				json = { "clang-format", "prettierd", "prettier", stop_after_first = true },
				php = { "pretty-php" },
			},

			format_on_save = {
				timeout_ms = 500,
				lsp_fallback = true,
			},
		})
	end,
}
