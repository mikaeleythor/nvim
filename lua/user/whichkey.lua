vim.api.nvim_set_keymap("n", "<space>", "", { noremap = true, silent = true })
vim.g.mapleader = " "
vim.g.maplocalleader = 'æ'

vim.o.timeout = true
vim.o.timeoutlen = 300

local wk = require("which-key")

-- NOTE: Keymaps in normal mode
wk.register({
	-- NOTE: Alt keymaps
	['<A-j>'] = { '<cmd>MoveLine(1)<cr>', "Move line down" },
	['<A-k>'] = { '<cmd>MoveLine(-1)<cr>', "Move line up" },
	['<A-h>'] = { '<cmd>MoveChar(-1)<cr>', "Move selection left" },
	['<A-l>'] = { '<cmd>MoveChar(1)<cr>', "Move selection right" },
	['<A-Left>'] = { '<c-w>H', 'Move window left' },
	['<A-Down>'] = { '<c-w>J', 'Move window down' },
	['<A-Up>'] = { '<c-w>K', 'Move window up' },
	['<A-Right>'] = { '<c-w>L', 'Move window right' },
	-- NOTE: Ctrl keymaps
	['<c-h>'] = { "<c-w>h", 'Move cursor left' },
	['<c-j>'] = { "<c-w>j", 'Move cursor down' },
	['<c-k>'] = { "<c-w>k", 'Move cursor up' },
	['<c-l>'] = { "<c-w>l", 'Move cursor right' },
	['<c-t>'] = { "<cmd>tabnew<cr>", 'Open new tab' },
	['<c-w>'] = { "<cmd>tabc<cr>", 'Close current tab' },
	['<c-s-l>'] = { "gt", 'Next tab' },
	['<c-s-h>'] = { "gT", 'Previous tab' },
	['<c-b>'] = { "<cmd>bw<cr>", 'Close current buffer' },
	['<c-s-j>'] = { "<cmd>bnext<cr>", 'Next buffer' },
	['<c-s-k>'] = { "<cmd>bprevious<cr>", 'Previous previous' },
	['gd'] = { function()
		vim.lsp.buf.definition()
	end, 'Go to definition' },
	['gD'] = { function()
		vim.lsp.buf.declaration()
	end, 'Go to declaration' },
	['gi'] = { function()
		vim.lsp.buf.implementation()
	end, 'Go to implementation' },
	['gr'] = { function()
		vim.lsp.buf.references()
	end, 'Go to references' },
	['K'] = { function()
		vim.lsp.buf.hover()
	end, 'Hover' }
}, { noremap = true, silent = true, mode = "n" })

-- NOTE: Keymaps in visual mode
wk.register({
	['<A-j>'] = { '<cmd>MoveBlock(1)<cr>', "Move block down" },
	['<A-k>'] = { '<cmd>MoveBlock(-1)<cr>', "Move block up" },
	['<A-h>'] = { '<cmd>MoveHBlock(-1)<cr>', "Move block left" },
	['<A-l>'] = { '<cmd>MoveHBlock(1)<cr>', "Move block right" },
}, { noremap = true, silent = true, mode = "v" })

-- NOTE: Keymaps in normal mode, prefixed by leader
wk.register({
	w = { "<cmd>w<cr>", "Write" },
	q = { "<cmd>q<cr>", "Quit" },
	e = { "<cmd>e<cr>", "Open" },
	b = { "<cmd>BufferTabsToggle<cr>", "Toggle buffer tabs" },
	o = {
		name = "+neorg",
		l = { function()
			vim.cmd("tcd ~/Documents/notes/linux")
			vim.cmd("Neorg workspace linux")
		end, "Linux notebook" },
		s = { function()
			vim.cmd("tcd ~/Documents/notes/school")
			vim.cmd("Neorg workspace school")
		end, "Linux notebook" },
		w = { function()
			vim.cmd("tcd ~/Documents/notes/work")
			vim.cmd("Neorg workspace work")
		end, "Work notebook" },
	},
	k = { "<cmd>Telescope keymaps<cr>", "Keymaps" },
	h = { ":set invhlsearch<cr>", "Toggle search highlights" },
	n = {
		name = "+noice",
		h = { "<cmd>NoiceTelescope<cr>", "Notification history" },
		d = { "<cmd>Noice dismiss<cr>", " Dismiss notification" },
	},
	f = {
		name = "+files",
		e = { ":Oil --float<cr>", "File browser" },
		f = { "<cmd>Telescope find_files<cr>", "Local files" },
		r = { "<cmd>Telescope oldfiles<cr>", "Recent files" },
		n = { "<cmd>enew<cr>", "New file" },
		b = { "<cmd>Telescope buffers<cr>", "Find buffer" },
		g = { "<cmd>Telescope live_grep<cr>", "Live grep" },
		c = { function()
			require("telescope.builtin").find_files({ search_dirs = { "~/.repos/shell-scripts/src/bash" } })
		end,
			"Shell scripts" },
		d = { function()
			require("telescope.builtin").find_files({ search_dirs = { "~/.repos/dotfiles" } })
		end,
			"Dotfiles" },
		l = { function()
			require("telescope.builtin").find_files({ search_dirs = { "~/.repos/nvim" } })
		end,
			"Open NVIM Config" },
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
		v = { "<cmd>DiffviewOpen<cr>", "Open DiffView" },
		x = { "<cmd>DiffviewClose<cr>", "Close DiffView" },
	},
	l = {
		name = "+lsp",
		f = { "<cmd>lua vim.lsp.buf.format { async = true }<cr>", "Format" },
		n = { "<cmd>lua vim.lsp.buf.rename()<cr>", "Rename" },
		r = { "<cmd>Telescope lsp_references<cr>", "LSP references" },
		d = { "<cmd>Telescope lsp_definitions<cr>", "LSP definitions" },
		t = { "<cmd>Trouble<cr>", "LSP type definitions" },
		i = { "<cmd>LspInfo<cr>", "LSP info" },

	},
	d = {
		name = "+debug",
		c = { "<cmd>DapContinue<cr>", "Continue" },
		u = { "<cmd>DapStepOut<cr>", "Step out" },
		o = { "<cmd>DapStepOver<cr>", "Step over" },
		i = { "<cmd>DapStepInto<cr>", "Step into" },
		d = { "<cmd>DapToggleBreakpoint<cr>", "Toggle breakpoint" },
		h = { "<cmd>DapToggleRepl<cr>", "Toggle repl" },
		t = { "<cmd>DapTerminate<cr>", "Terminate" },
		r = { function()
			require("dap").restart()
		end, "restart" },
		j = { function()
			require("dap").up()
		end, "Go up in stacktrace without stepping" },
		k = { function()
			require("dap").down()
		end, "Go down in stacktrace without stepping" },
		g = { function()
			require("dap").run_to_cursor()
		end, "Continue execution to current cursor" }
	},
	j = {
		name = "+todo",
		t = { "<cmd>TodoTelescope<cr>", "Todo Telescope" },
		n = { "<cmd>lua require('todo-comments').jump_next({keywords={'ERROR','WARNING','TODO', 'TEST'}})<cr>", "Next todo" },
		p = { "<cmd>lua require('todo-comments').jump_prev({keywords={'ERROR','WARNING','TODO'}})<cr>", "Next todo" },
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


function _G.set_terminal_keymaps()
  local topts = {buffer = 0}
  vim.keymap.set('t', '<esc>', [[<C-\><C-n>]], topts)
  vim.keymap.set('t', 'jk', [[<C-\><C-n>]], topts)
  vim.keymap.set('t', '<C-h>', [[<Cmd>wincmd h<CR>]], topts)
  vim.keymap.set('t', '<C-j>', [[<Cmd>wincmd j<CR>]], topts)
  vim.keymap.set('t', '<C-k>', [[<Cmd>wincmd k<CR>]], topts)
  vim.keymap.set('t', '<C-l>', [[<Cmd>wincmd l<CR>]], topts)
end

-- if you only want these mappings for toggle term use term://*toggleterm#* instead
vim.cmd('autocmd! TermOpen term://* lua set_terminal_keymaps()')
