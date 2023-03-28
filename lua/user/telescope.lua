local telescope = require("telescope")
local fb_actions = telescope.extensions.file_browser.actions
telescope.setup({
	extensions = {
		file_browser = {
			hijack_netrw = true,
			hide_parent_dir = true,
			mappings = {
				["i"] = {
					["<C-u>"] = fb_actions.goto_parent_dir,
					["<C-a>"] = fb_actions.create,
				},
				["n"] = {
					["u"] = fb_actions.goto_parent_dir,
					["a"] = fb_actions.create,
				}

			}
		},
	},
})
telescope.load_extension('possession')
telescope.load_extension('file_browser')
