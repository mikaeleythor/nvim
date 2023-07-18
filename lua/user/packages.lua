return {
	{
		"NvChad/nvim-colorizer.lua",
		config = function() require('colorizer').setup({}) end
	},
	"windwp/nvim-autopairs", -- autoclosing brackets plugin
	"lervag/vimtex", -- LaTeX compiler
	"iamcco/markdown-preview.nvim",
	"preservim/nerdcommenter", -- block commenting
	"nvim-lualine/lualine.nvim", -- statusline
	{
		"jcdickinson/codeium.nvim",
		commit = "b1ff0d6c993e3d87a4362d2ccd6c660f7444599f",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"hrsh7th/nvim-cmp",
		},
		config = function() require("codeium").setup({}) end
	},
	{
		"glepnir/dashboard-nvim",
		commit = "0af0ad1",
		-- NOTE: Setting priority to make sure it loads before indent-blankline
		--priority = 1000,
		event = "VimEnter",
		lazy = false,
		config = function()
			vim.g.indentLine_fileTypeExclude = { 'dashboard', 'startify' }
			require("dashboard").setup(require("user.dashboard"))
		end,
		dependencies = {
			"nvim-tree/nvim-web-devicons",
		},
	},
	{
		"akinsho/toggleterm.nvim",
		config = function()
			require("toggleterm").setup(require("user.toggleterm"))
		end,
	},
	{
		"folke/which-key.nvim",
		config = function()
			require('which-key').setup()
		end
	},
	'fedepujol/move.nvim',
	{
		"folke/todo-comments.nvim",
		dependencies = "nvim-lua/plenary.nvim",
		config = function()
			require("todo-comments").setup {}
		end
	},
	{
		'jedrzejboczar/possession.nvim',
		dependencies = { 'nvim-lua/plenary.nvim' },
	},
	{
		'lewis6991/gitsigns.nvim',
		config = function()
			require('gitsigns').setup()
		end
	},
	{ "lukas-reineke/indent-blankline.nvim", lazy = false },
	--{ 'giusgad/hologram.nvim', config = function()
	--require('hologram').setup {
	--auto_display = true,
	--}
	--end
	--},
	{ '3rd/image.nvim',
		dependencies = {
			{
				"nvim-treesitter/nvim-treesitter",
				build = ":TSUpdate",
				config = function()
					require("nvim-treesitter.configs").setup({
						ensure_installed = { "markdown" },
						highlight = { enable = true },
					})
				end,
			},
		},
		opts = {
			backend = "kitty",
			integrations = {
				markdown = {
					enabled = true,
					sizing_strategy = "auto",
					download_remote_images = true,
					clear_in_insert_mode = false,
				},
				neorg = {
					enabled = true,
					download_remote_images = true,
					clear_in_insert_mode = false,
				},
			},
			max_width = nil,
			max_height = nil,
			max_width_window_percentage = nil,
			max_height_window_percentage = 50,
			kitty_method = "normal",
			kitty_tmux_write_delay = 10, -- makes rendering more reliable with Kitty+Tmux
			window_overlap_clear_enabled = false, -- toggles images when windows are overlapped
			window_overlap_clear_ft_ignore = { "cmp_menu", "cmp_docs", "" },
		}
	},
	{
		"nvim-neorg/neorg",
		commit = '67c729f',
		config = function()
			require('neorg').setup({
				load = {
					["core.defaults"] = {}, -- Loads default behaviour
					["core.concealer"] = {}, -- Adds pretty icons to your documents
					["core.summary"] = {},
					["core.dirman"] = { -- Manages Neorg workspaces
						config = {
							workspaces = {
								school = "~/Documents/notes/school",
								linux = "~/Documents/notes/linux",
								work = "~/Documents/notes/work",
							},
							default_workspace = "linux",
						},
					},
					["core.integrations.telescope"] = {},
					--["external.hello-world"] = {},
					["external.mermaid"] = {},
					["core.looking-glass"] = {},
					-- HACK: Localleader keybinds
					["core.keybinds"] = {
						config = {
							hook = function(keybinds)
								-- Binds the `gtd` key in `norg` mode to execute `:echo 'Hello'`
								keybinds.map("norg", "n", "<localleader>fi",
									"<cmd>Neorg index<CR>")
								keybinds.map("norg", "n", "<localleader>fh",
									"<cmd>Telescope neorg search_headings<CR>")
								keybinds.map("norg", "n", "<localleader>jj",
									"<cmd>Neorg journal today<CR>")
								keybinds.map("norg", "n", "<localleader>jt",
									"<cmd>Neorg journal toc<CR>")
								keybinds.map("norg", "n", "<localleader>fl",
									"<cmd>Neorg keybind all core.looking-glass.magnify-code-block<CR>")
							end,
						}
					}
				},
				dependencies = { dir = "~/Desktop/lua/mermaid/module.lua" },
			}, {}, {})
		end,
		run = ":Neorg sync-parsers",
		dependencies = { "nvim-lua/plenary.nvim", "nvim-neorg/neorg-telescope" },
	},
	{
		"folke/noice.nvim",
		commit = "ed7bbe0",
		dependencies = {
			"MunifTanjim/nui.nvim",
			"rcarriga/nvim-notify",
		}
	},
	'nanotee/sqls.nvim',
	{ 'postfen/clipboard-image.nvim', config = function()
		require('clipboard-image').setup {
			norg = {
				img_dir = { "img" }, -- Use table for nested dir (New feature form PR #20)
				--img_dir_txt = "/assets/img",
				img_handler = function(img) -- New feature from PR #22
					local script = string.format('./image_compressor.sh "%s"', img.path)
					os.execute(script)
				end,
				affix = "![](%s)"
			}
		}
	end },
	{
		"sindrets/diffview.nvim",
		commit = "f9ddbe7"
	},
	'jbyuki/nabla.nvim',

	{
		"catppuccin/nvim",
		as = "catppuccin",
		config = function()
			require("catppuccin").setup()
		end,
	},

	-- treesitter
	{
		"nvim-treesitter/nvim-treesitter",
		run = ":TSUpdate",
	},

	-- telescope
	{
		"nvim-telescope/telescope.nvim",
		--commit = "76ea9a898d3307244dce3573392dcf2cc38f340f",
		--tag = "0.1.0",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"BurntSushi/ripgrep",
			"sharkdp/fd",
		},
	},
	{
		'stevearc/oil.nvim',
		config = function() require('oil').setup() end
	},
	-- LSP
	"williamboman/mason.nvim", -- LSP installer
	"jose-elias-alvarez/null-ls.nvim",
	"williamboman/mason-lspconfig.nvim", -- Recommended plugin with lspconfig
	"neovim/nvim-lspconfig", -- LSP configuration
	"mfussenegger/nvim-jdtls", -- LSP extensions for eclipse.jdt.ls
	"mfussenegger/nvim-dap", -- Debug Adapter Protocol plugin
	"onsails/lspkind-nvim", -- Formatting plugin

	-- cmp plugins
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
	"saadparwaiz1/cmp_luasnip", -- Snippets src for nvim-cmp
}
