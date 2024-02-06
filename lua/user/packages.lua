-- TODO: Sort plugins by functionality (LSP, DAP, GIT, Keymaps)
local home = vim.fn.expand("$HOME")

return {
	-- Navigation
	{ -- Starting page
		"glepnir/dashboard-nvim",
		commit = "0af0ad1",
		-- NOTE: Setting priority to make sure it loads before indent-blankline
		priority = 100,
		event = "VimEnter",
		lazy = false,
		config = function()
			vim.g.indentLine_fileTypeExclude = { "dashboard", "startify" }
			require("dashboard").setup(require("user.dashboard"))
		end,
		dependencies = {
			"nvim-tree/nvim-web-devicons",
		},
	},
	{ -- Tabs for buffers
		"tomiis4/BufferTabs.nvim",
		dependencies = {
			"nvim-tree/nvim-web-devicons", -- optional
		},
		lazy = false,
		config = function()
			require("buffertabs").setup({
				display = "column",
				horizontal = "right",
				vertical = "center",
			})
		end,
	},
	{ -- Tool for finding and opening files
		"nvim-telescope/telescope.nvim",
		tag = "0.1.2",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"BurntSushi/ripgrep",
			"sharkdp/fd",
		},
	},
	{ -- Buffer based file explorer
		"stevearc/oil.nvim",
		config = function()
			require("oil").setup()
		end,
	},
	{ -- Navigating keymaps
		"folke/which-key.nvim",
		config = function()
			require("which-key").setup()
		end,
	},
	{
		"jedrzejboczar/possession.nvim",
		dependencies = { "nvim-lua/plenary.nvim" },
	},
	{
		"NeogitOrg/neogit",
		dependencies = {
			"nvim-lua/plenary.nvim", -- required
			"sindrets/diffview.nvim", -- optional - Diff integration

			-- Only one of these is needed, not both.
			"nvim-telescope/telescope.nvim", -- optional
			"ibhagwan/fzf-lua", -- optional
		},
		config = true,
	},

	-- UI/UX
	{ -- Highlights text with colors (black,red green)
		"NvChad/nvim-colorizer.lua",
		config = function()
			require("colorizer").setup({})
		end,
	},
	{ -- Colorschemes
		"catppuccin/nvim",
		as = "catppuccin",
		lazy = false,
		priority = 1001,
		config = function()
			require("catppuccin").setup()
		end,
	},
	"windwp/nvim-autopairs", -- autoclosing brackets plugin
	"stevearc/dressing.nvim", -- Makes input go woo
	"onsails/lspkind-nvim", -- Formatting plugin
	"nvim-lualine/lualine.nvim", -- statusline
	{ -- GUI
		"folke/noice.nvim",
		commit = "ed7bbe0",
		dependencies = {
			"MunifTanjim/nui.nvim",
			"rcarriga/nvim-notify",
		},
	},
	{ -- Git signs on the left
		"lewis6991/gitsigns.nvim",
		config = function()
			require("gitsigns").setup({
				sign_priority = 100,
			})
		end,
	},

	-- Input
	{
		"numToStr/Comment.nvim",
		-- opts = {
		-- add any options here
		-- },
		lazy = false,
		config = function()
			require("Comment").setup()
		end,
	},
	"fedepujol/move.nvim",
	-- {
	-- 	"gaoDean/autolist.nvim",
	-- 	ft = {
	-- 		"markdown",
	-- 		"text",
	-- 		"tex",
	-- 		"plaintex",
	-- 		"norg",
	-- 	},
	-- 	config = function()
	-- 		require("autolist").setup()
	-- 		-- vim.keymap.set("i", "<tab>", "<cmd>AutolistTab<cr>")
	-- 		-- vim.keymap.set("i", "<s-tab>", "<cmd>AutolistShiftTab<cr>")
	-- 		-- vim.keymap.set("i", "<c-t>", "<c-t><cmd>AutolistRecalculate<cr>") -- an example of using <c-t> to indent
	-- 		vim.keymap.set("i", "<CR>", "<CR><cmd>AutolistNewBullet<cr>")
	-- 		-- vim.keymap.set("n", "o", "o<cmd>AutolistNewBullet<cr>")
	-- 		-- vim.keymap.set("n", "O", "O<cmd>AutolistNewBulletBefore<cr>")
	-- 		vim.keymap.set("n", "<CR>", "<cmd>AutolistToggleCheckbox<cr><CR>")
	-- 		-- vim.keymap.set("n", "<C-r>", "<cmd>AutolistRecalculate<cr>")
	-- 		-- cycle list types with dot-repeat
	-- 		vim.keymap.set("n", "<leader>cn", require("autolist").cycle_next_dr, { expr = true })
	-- 		vim.keymap.set("n", "<leader>cp", require("autolist").cycle_prev_dr, { expr = true })
	-- 		-- if you don't want dot-repeat
	-- 		-- vim.keymap.set("n", "<leader>cn", "<cmd>AutolistCycleNext<cr>")
	-- 		-- vim.keymap.set("n", "<leader>cp", "<cmd>AutolistCycleNext<cr>")
	-- 		-- functions to recalculate list on edit
	-- 		vim.keymap.set("n", ">>", ">><cmd>AutolistRecalculate<cr>")
	-- 		vim.keymap.set("n", "<<", "<<<cmd>AutolistRecalculate<cr>")
	-- 		vim.keymap.set("n", "dd", "dd<cmd>AutolistRecalculate<cr>")
	-- 		vim.keymap.set("v", "d", "d<cmd>AutolistRecalculate<cr>")
	-- 	end,
	-- },
	{ -- Paste images into markdown
		"postfen/clipboard-image.nvim",
		config = function()
			require("clipboard-image").setup({
				norg = {
					img_dir = { "img" }, -- Use table for nested dir (New feature form PR #20)
					--img_dir_txt = "/assets/img",
					img_handler = function(img) -- New feature from PR #22
						local script = string.format('./image_compressor.sh "%s"', img.path)
						os.execute(script)
					end,
					affix = "![](%s)",
				},
			})
		end,
	},
	{ -- Highlighted TODO comments
		"folke/todo-comments.nvim",
		dependencies = "nvim-lua/plenary.nvim",
		config = function()
			require("todo-comments").setup({})
		end,
	},

	{ -- Markdown previewer
		"toppair/peek.nvim",
		event = { "VeryLazy" },
		build = "deno task --quiet build:fast",
		config = function()
			require("peek").setup()
			-- refer to `configuration to change defaults`
			vim.api.nvim_create_user_command("PeekOpen", require("peek").open, {})
			vim.api.nvim_create_user_command("PeekClose", require("peek").close, {})
		end,
	},

	-- AI Tools
	{ -- Chatgpt plugin
		"jackMort/ChatGPT.nvim",
		event = "VeryLazy",
		config = function()
			require("chatgpt").setup({
				api_key_cmd = "base64 --decode " .. home .. "/.config/nvim/.gptkey",
			})
		end,
		dependencies = {
			"MunifTanjim/nui.nvim",
			"nvim-lua/plenary.nvim",
			"nvim-telescope/telescope.nvim",
		},
	},
	{
		"HPRIOR/telescope-gpt",
		event = "VeryLazy",
		dependencies = { "nvim-telescope/telescope.nvim", "jackMort/ChatGPT.nvim" },
	},
	{
		"jcdickinson/codeium.nvim",
		-- commit = "b1ff0d6c993e3d87a4362d2ccd6c660f7444599f",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"hrsh7th/nvim-cmp",
		},
		config = function()
			require("codeium").setup({})
		end,
	},

	-- Terminals
	{
		"akinsho/toggleterm.nvim",
		config = function()
			require("toggleterm").setup(require("user.toggleterm"))
		end,
	},

	{ -- Indent guides
		"lukas-reineke/indent-blankline.nvim",
		lazy = false,
		priority = 99,
		main = "ibl",
		opts = {},
	},
	{ -- Notetaking plugin
		"nvim-neorg/neorg",
		commit = "67c729f",
		config = function()
			require("neorg").setup(require("user.neorg"))
		end,
		run = ":Neorg sync-parsers",
		dependencies = { "nvim-lua/plenary.nvim", "nvim-neorg/neorg-telescope" },
	},
	{ -- Nice for handling merge conflicts
		"sindrets/diffview.nvim",
		commit = "f9ddbe7",
	},

	-- LSP
	{ -- Syntax parser
		"nvim-treesitter/nvim-treesitter",
		run = ":TSUpdate",
	},
	"lervag/vimtex", -- LaTeX compiler
	"williamboman/mason.nvim", -- LSP installer
	"williamboman/mason-lspconfig.nvim", -- Recommended plugin with lspconfig
	"neovim/nvim-lspconfig", -- LSP configuration
	"mfussenegger/nvim-jdtls", -- LSP extensions for eclipse.jdt.ls
	"nanotee/sqls.nvim", -- LSP plugin for sqls LSP server

	-- Debugging
	"mfussenegger/nvim-dap", -- Debug Adapter Protocol plugin
	{ "rcarriga/nvim-dap-ui", dependencies = { "mfussenegger/nvim-dap" } },
	{ -- Neovim development lsp
		"folke/neodev.nvim",
		opts = { library = { plugins = { "nvim-dap-ui" }, types = true } },
	},
	"mfussenegger/nvim-lint", -- Linter
	"mhartington/formatter.nvim", -- Formatter
	{ -- Refactoring plugin
		"ThePrimeagen/refactoring.nvim",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-treesitter/nvim-treesitter",
		},
		config = function()
			require("refactoring").setup()
		end,
	},
	{ -- LSP diagnostics, jumps, and more
		"folke/trouble.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
	},

	-- Completion
	"rafamadriz/friendly-snippets",
	{
		"L3MON4D3/LuaSnip",
		run = "make install_jsregexp",
	},
	"hrsh7th/nvim-cmp", -- Autocompletion plugin
	"hrsh7th/cmp-buffer", -- Autocompletion source
	"hrsh7th/cmp-path", -- Autocompletion source
	"hrsh7th/cmp-nvim-lsp", -- Autocompletion source
	"hrsh7th/cmp-nvim-lua", -- Autocompletion source
	"hrsh7th/cmp-cmdline", -- Autocompletion source
	"hrsh7th/cmp-emoji", -- Autocompletion source
	"saadparwaiz1/cmp_luasnip", -- Snippets src for nvim-cmp
}
