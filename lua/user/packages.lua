require("packer").startup(function(use)
	-- my plugins
	use("wbthomason/packer.nvim") -- have packer manage itself
	use({
		"NvChad/nvim-colorizer.lua",
		config = function()
			require('colorizer').setup({})
		end
	}) -- hex coloriser (e.g. red #FFFFFF)
	use("windwp/nvim-autopairs") -- autoclosing brackets plugin
	use("lervag/vimtex") -- LaTeX compiler
	use("iamcco/markdown-preview.nvim")
	use({
		-- nvim file explorer
		"nvim-tree/nvim-tree.lua",
		requires = {
			"nvim-tree/nvim-web-devicons",
		},
	})
	use("preservim/nerdcommenter") -- block commenting
	use("preservim/tagbar") -- tagbar
	use("nvim-lualine/lualine.nvim") -- statusline
	use({
		"glepnir/dashboard-nvim",
		commit = "0af0ad1",
		event = "VimEnter",
		config = function()
			require("dashboard").setup(require("user.dashboard"))
		end,
		requires = {
			"nvim-tree/nvim-web-devicons",
		},
	})
	use({
		"akinsho/toggleterm.nvim",
		tag = "*",
		config = function()
			require("toggleterm").setup(require("user.toggleterm"))
		end,
	})
	use({
		"folke/which-key.nvim",
		config = function()
			require('which-key').setup()
		end
	})
	use('fedepujol/move.nvim')
	use("mfussenegger/nvim-lint")
	use {
		"folke/todo-comments.nvim",
		requires = "nvim-lua/plenary.nvim",
		config = function()
			require("todo-comments").setup {}
		end
	}
	use {
		'jedrzejboczar/possession.nvim',
		requires = { 'nvim-lua/plenary.nvim' },
	}
	use {
		'lewis6991/gitsigns.nvim',
		config = function()
			require('gitsigns').setup()
		end
	}
	use({ "lukas-reineke/indent-blankline.nvim" })
	use({
		'nmac427/guess-indent.nvim',
		config = function() require('guess-indent').setup {} end,
	})

	use({
		"folke/noice.nvim",
		commit = "ed7bbe0",
		requires = {
			"MunifTanjim/nui.nvim",
			"rcarriga/nvim-notify",
		}
	})
	use 'nanotee/sqls.nvim'
	use 'ekickx/clipboard-image.nvim'
	use({
		"sindrets/diffview.nvim",
		commit = "f9ddbe7"
	})

	-- colorschemes
	--use({
	--"folke/tokyonight.nvim",
	--commit = "66bfc2e8f754869c7b651f3f47a2ee56ae557764",
	--})
	use({
		"catppuccin/nvim",
		as = "catppuccin",
		config = function()
			require("catppuccin").setup()
		end,
	})

	-- treesitter
	use({
		"nvim-treesitter/nvim-treesitter",
		run = ":TSUpdate",
	})

	-- telescope
	use({
		"nvim-telescope/telescope.nvim",
		--commit = "76ea9a898d3307244dce3573392dcf2cc38f340f",
		--tag = "0.1.0",
		requires = {
			"nvim-lua/plenary.nvim",
			"BurntSushi/ripgrep",
			"sharkdp/fd",
		},
	})
	use {
		"nvim-telescope/telescope-file-browser.nvim",
		requires = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" },
	}
	-- LSP
	use("williamboman/mason.nvim") -- LSP installer
	use("jose-elias-alvarez/null-ls.nvim")
	use("williamboman/mason-lspconfig.nvim") -- Recommended plugin with lspconfig
	use("neovim/nvim-lspconfig") -- LSP configuration
	use("mfussenegger/nvim-jdtls") -- LSP extensions for eclipse.jdt.ls
	use("mfussenegger/nvim-dap") -- Debug Adapter Protocol plugin
	use("onsails/lspkind-nvim") -- Formatting plugin

	-- cmp plugins
	use("rafamadriz/friendly-snippets")
	use({
		"L3MON4D3/LuaSnip",
		run = "make install_jsregexp",
	})
	use("hrsh7th/nvim-cmp") -- Autocompletion plugin
	use("hrsh7th/cmp-buffer") -- Autocompletion source
	use("hrsh7th/cmp-path") -- Autocompletion source
	use("hrsh7th/cmp-nvim-lsp") -- Autocompletion source
	use("hrsh7th/cmp-nvim-lua") -- Autocompletion source
	use("hrsh7th/cmp-cmdline") -- Autocompletion source
	use("saadparwaiz1/cmp_luasnip") -- Snippets src for nvim-cmp
end)
