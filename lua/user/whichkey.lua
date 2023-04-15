vim.o.timeout = true
vim.o.timeoutlen = 300

local wk = require("which-key")

-- Keymaps in normal mode, prefixed by leader
wk.register({
	w = { "<cmd>w<cr>", "Write" },
	q = { "<cmd>q<cr>", "Quit" },
	e = { "<cmd>Telescope file_browser path=%:p:h select_buffer=true<cr>", "File browser" },
	n = { "<cmd>enew<cr>", "New file" },
	k = { "<cmd>Telescope keymaps<cr>", "Keymaps" },
	f = {
		name = "+files",
		f = { "<cmd>Telescope find_files<cr>", "Local files" },
		h = { "<cmd>Telescope file_browser path=~ <cr>", "File browser" },
		r = { "<cmd>Telescope oldfiles<cr>", "Recent files" },
		n = { "<cmd>enew<cr>", "New file" },
		b = { "<cmd>Telescope buffers<cr>", "Find buffer" },
		g = { "<cmd>Telescope live_grep<cr>", "Live grep" },
		c = { "<cmd>e ~/.repos/shell-scripts/src/bash<cr>", "Shell scripts" },
		d = { "<cmd>e ~/.repos/dotfiles<cr>", "Dotfiles" },
		l = { "<cmd>e ~/.repos/nvim<cr>", "Open NVIM Config" },
		i = { "<cmd>source ~/.config/nvim/init.lua<cr>", "Source dotfiles" },
	},
	s = {
		name = "+sessions",
		l = { "<cmd>Telescope possession list<cr>", "List sessions" },
		r = { "<cmd>SLoad<cr>", "Load last session" },
		s = { "<cmd>SSave!<cr>", "Save session" },
		c = { "<cmd>SClose<cr>", "Close session" },
		d = { "<cmd>SDelete<cr>", "Delete session" },
	},
	g = {
		name = "+git",
		s = { "<cmd>Telescope git_status<cr>", "Git status" },
		c = { "<cmd>Telescope git_commits<cr>", "Git commits" },
		b = { "<cmd>Telescope git_branches<cr>", "Git branches" },
		d = { "<cmd>Telescope git_bcommits<cr>", "Git diff current buffer" },
	},
	l = {
		name = "+lsp",
		f = { "<cmd>lua vim.lsp.buf.format { async = true }<cr>", "Format" },
		n = { "<cmd>lua vim.lsp.buf.rename()<cr>", "Rename" },
		r = { "<cmd>Telescope lsp_references<cr>", "LSP references" },
		d = { "<cmd>Telescope lsp_definitions<cr>", "LSP definitions" },
		t = { "<cmd>Telescope lsp_type_definitions<cr>", "LSP type definitions" },
		i = { "<cmd>LspInfo<cr>", "LSP info" },

	},
	d = {
		name = "+todo",
		t = {"<cmd>TodoTelescope<cr>", "Todo Telescope"},
		n = {"<cmd>lua require('todo-comments').jump_next({keywords={'ERROR','WARNING','TODO', 'TEST'}})<cr>", "Next todo"},
		p = {"<cmd>lua require('todo-comments').jump_prev({keywords={'ERROR','WARNING','TODO'}})<cr>", "Next todo"},
	},
	p = {
		name = "+plugins",
		u = { "<cmd>PackerUpdate<cr>", "Update plugins" },
		c = { "<cmd>PackerCompile<cr>", "Compile plugins" },
	},
	t = {
		name = "+toggleterm",
		h = { "<cmd>ToggleTerm direction=horizontal<cr>", "Spawn horizontal terminal" },
		v = { "<cmd>ToggleTerm direction=vertical<cr>", "Spawn vertical terminal" },
		c = { "<cmd>ToggleTermSendCurrentLine<cr>", "Send current line" },
	},
}, { prefix = "<leader>", noremap = true, silent = true })

wk.register({
	t = {
		name = "+toggleterm",
		l = { "<cmd>'<,'>ToggleTermSendVisualLines<cr>", "Send visual lines" },
	}
}, { prefix = "<leader>", noremap = true, silent = true, mode = { "v", "x" } })

wk.register({
	t = {
		name = "+toggleterm",
		s = { "<cmd>'<,'>ToggleTermSendVisualSelection<cr>", "Send visual selection" },
	}
}, { prefix = "<leader>", noremap = true, silent = true, mode = "v" })
