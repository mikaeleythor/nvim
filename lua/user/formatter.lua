-- Utilities for creating configurations
local util = require("formatter.util")

-- Provides the Format, FormatWrite, FormatLock, and FormatWriteLock commands
require("formatter").setup({
	-- Enable or disable logging
	logging = true,
	-- Set the log level
	log_level = vim.log.levels.WARN,
	-- All formatter configurations are opt-in
	filetype = {
		cs = {
			require("formatter.filetypes.cs").csharpier,
		},
		markdown = {
			function()
				return {
					exe = "mdformat",
					args = {
						"-",
					},
					stdin = true,
				}
			end,
		},
		lua = {
			require("formatter.filetypes.lua").stylua,
		},
		sql = {
			require("formatter.filetypes.sql").pgformat,
		},
		sh = {
			require("formatter.filetypes.sh").shfmt,
		},
	},
})
