vim.opt.list = true
vim.g.indentLine_fileTypeExclude = { "dashboard", "norg" }

require("ibl").setup({
	exclude = {
		filetypes = { "dashboard", "norg" },
		buftypes = { "terminal", "nofile" },
	},
})
