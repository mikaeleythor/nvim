local configs = require("nvim-treesitter.configs")

configs.setup({
	-- TODO: Revise
	ensure_installed = {
		"python",
		"java",
		"javascript",
		"html",
		"css",
		"lua",
		"dockerfile",
		"bash",
	},
	highlight = {
		enable = true,
		disable = { "markdown", "tex" },
	},
	-- TODO: Disable this in favor of nvim-autopairs
	autopairs = {
		enable = true,
	},
	autotag = {
		enable = true,
	},
	-- TODO: Disable this in favor of guess-indent
	indent = {
		enable = true,
		disable = { "html", "css", "sql", "tex", "javascript", "md", "norg", "lua" },
	},
})
