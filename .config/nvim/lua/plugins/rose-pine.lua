-- lua/plugins/rose-pine.lua
return {
	"rose-pine/neovim",
	Lazy = true,
	name = "rose-pine",
	config = function()
		vim.cmd("colorscheme rose-pine-main")
	end,
}
