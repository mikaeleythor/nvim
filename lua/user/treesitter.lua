local configs = require 'nvim-treesitter.configs'

configs.setup {
	ensure_installed = {
		maintained = true,
	},
	highlight = {
		enable = true,
	},
	indent = {
		enable = false,
	}
}
