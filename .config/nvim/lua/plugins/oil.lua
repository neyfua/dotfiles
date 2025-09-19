return {
	{
		"stevearc/oil.nvim",
		---@module 'oil'
		---@type oil.SetupOpts
		opts = {},
		dependencies = { "nvim-tree/nvim-web-devicons" },
		config = function()
			require("oil").setup({
				default_file_explorer = true,
				columns = {
					"icon",
					-- "permissions",
					-- "size",
					"mtime",
				},
				buf_options = {
					buflisted = false,
					bufhidden = "hide",
				},
				view_options = {
					show_hidden = true,
				},
				keymaps = {
					["<CR>"] = "actions.select",
					["<leader>c"] = { "actions.close", mode = "n" },
				},
				use_default_keymaps = false,
			})
		end,
	},
}
