vim.o.timeout = true
vim.o.timeoutlen = 300

local wk = require("which-key")

-- Keymaps in normal mode, prefixed by leader
wk.register({

	w = { "<cmd>w<cr>", "Write" },
	q = { "<cmd>q<cr>", "Quit" },
	e = { "<cmd>NvimTreeToggle<cr>", "File tree" },
	n = { "<cmd>enew<cr>", "New file" },
	f = {
		name = "+file",
		f = { "<cmd>Telescope find_files<cr>", "Find file" },
		r = { "<cmd>Telescope oldfiles<cr>", "Recent files" },
		b = { "<cmd>Telescope buffers<cr>", "Find buffer" },
		n = { "<cmd>enew<cr>", "New file" },
		d = { "<cmd>e ~/.config/nvim<cr>", "Dotfiles" },
		i = { "<cmd>source ~/.config/nvim/init.lua<cr>", "Source dotfiles" },
	},
	l = {
		name = "+lsp",
		f = { "<cmd>lua vim.lsp.buf.format { async = true }<cr>", "Format" },
		r = { "<cmd>lua vim.lsp.buf.rename()<cr>", "Rename" },
	},
	p = {
		name = "+plugins",
		u = { "<cmd>PackerUpdate<cr>", "Update plugins" },
		c = { "<cmd>PackerCompile<cr>", "Compile plugins" },
	},
	t = {
		name = "+toggleterm",
		s = { "<cmd>ToggleTermSendVisualSelection<cr>", "Send visual selection" },
		h = { "<cmd>ToggleTerm direction=horizontal<cr>", "Spawn horizontal terminal" },
		v = { "<cmd>ToggleTerm direction=vertical<cr>", "Spawn vertical terminal" },
		l = { "<cmd>ToggleTermSendVisualLines<cr>", "Send visual lines" },
		c = { "<cmd>ToggleTermSendCurrentLine<cr>", "Send current line" },
	},
}, { prefix = "<leader>", noremap = true, silent = true })
