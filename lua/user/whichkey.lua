vim.o.timeout = true
vim.o.timeoutlen = 300

local wk = require("which-key")
local opts = { noremap = true, silent = true, prefix = "<leader>" }

wk.register({

	f = {
		name = "+file",
		f = { "<cmd>Telescope find_files<cr>", "Find file" },
		r = { "<cmd>Telescope oldfiles<cr>", "Recent files" },
		b = { "<cmd>Telescope buffers<cr>", "Find buffer" },
		n = { "<cmd>enew<cr>", "New file" },
		d = { "<cmd>e ~/.config/nvim<cr>", "Dotfiles" },
		i = { "<cmd>source ~/.config/nvim/init.lua<cr>", "Source dotfiles" },
	},
}, opts)

wk.register({

	l = {
		name = "+lsp",
		f = { "<cmd>lua vim.lsp.buf.format { async = true }<cr>", "Format" },
		r = { "<cmd>lua vim.lsp.buf.rename()<cr>", "Rename" },
	},
}, opts)

wk.register({

	p = {
		name = "+plugins",
		u = { "<cmd>PackerUpdate<cr>", "Update plugins" }, 
		c = { "<cmd>PackerCompile<cr>", "Compile plugins" },
	},
}, opts)

wk.register({
	t = {
		name = "+toggleterm",
		s = { "<cmd>ToggleTermSendVisualSelection<cr>", "Send visual selection" },
		h = { "<cmd>ToggleTerm direction=horizontal<cr>", "Spawn horizontal terminal" },
		v = { "<cmd>ToggleTerm direction=vertical<cr>", "Spawn vertical terminal" },
		l = { "<cmd>ToggleTermSendVisualLines<cr>", "Send visual lines" },
		c = { "<cmd>ToggleTermSendCurrentLine<cr>", "Send current line" },
	},
}, opts)
