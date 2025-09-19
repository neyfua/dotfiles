require("plugins.treesitter").setup({
	ensure_installed = {
		"help",
		"html",
		"css",
		"scss",
		"python",
		"c",
		"cpp",
		"java",
		"json",
		"json5",
		"kdl",
		"lua",
		"rust",
		"go",
		"bash",
		"fish",
		"vim",
		"vimdoc",
		"query",
		"markdown",
		"markdown_inline",
	},

	-- Install parsers synchronously (only applied to `ensure_installed`)
	sync_install = true,

	-- Automatically install missing parsers when entering buffer
	-- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
	auto_install = true,

	highlight = {
		enable = true,

		-- Setting this to true will run `:h syntax` and tree-sitter at the same time.
		-- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
		-- Using this option may slow down your editor, and you may see some duplicate highlights.
		-- Instead of true it can also be a list of languages
		additional_vim_regex_highlighting = false,
	},
})
