return {
	{
		"williamboman/mason.nvim",
		config = function()
			require("mason").setup()
		end,
	},

	{
		"williamboman/mason-lspconfig.nvim",
		config = function()
			require("mason-lspconfig").setup({
				ensure_installed = {
					"clangd",
					"html",
					"cssls",
					"lua_ls",
					"pyright",
				},
			})
		end,
	},

	{
		"neovim/nvim-lspconfig",
		config = function()
			local notify = vim.notify
			vim.notify = function(msg, ...)
				if msg:match("require%('lspconfig'%)") then
					return
				end
				notify(msg, ...)
			end

			local lspconfig = require("lspconfig")
			local capabilities = require("blink.cmp").get_lsp_capabilities()

			lspconfig.lua_ls.setup({
				capabilities = capabilities,
			})
			lspconfig.html.setup({ capabilities = capabilities })
			lspconfig.cssls.setup({ capabilities = capabilities })
			lspconfig.clangd.setup({ capabilities = capabilities })
			lspconfig.pyright.setup({ capabilities = capabilities })
		end,
	},
}
