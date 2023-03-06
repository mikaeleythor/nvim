local configs = require("nvim-treesitter.configs")

configs.setup({
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
		disable = { "markdown" },
	},
	autopairs = {
		enable = true,
	},
	autotag = {
		enable = true,
	},
	indent = {
		enable = true,
		disable = { "html", "css", "sql", "tex", "js", "javascript" },
	},
})
