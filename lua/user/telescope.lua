local telescope = require("telescope")
telescope.setup({
	defaults = {
		file_ignore_patterns = {
			"node_modules",
		},
	},
	extensions = {
		gpt = {
			title = "Gpt Actions",
			commands = {
				"add_tests",
				"chat",
				"docstring",
				"explain_code",
				"fix_bugs",
				"grammar_correction",
				"interactive",
				"optimize_code",
				"summarize",
				"translate",
			},
			theme = require("telescope.themes").get_dropdown({}),
		},
	},
})
telescope.load_extension("possession")
telescope.load_extension("gpt")
