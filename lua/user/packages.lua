require('packer').startup(function()

	-- my plugins
	use 'wbthomason/packer.nvim'						-- have packer manage itself
  use 'NvChad/nvim-colorizer.lua'					-- hex coloriser (e.g. red #FFFFFF)
	use 'windwp/nvim-autopairs'           	-- autoclosing brackets plugin
	use 'lervag/vimtex'											-- LaTeX compiler
	use {																		-- markdown previewer
		'iamcco/markdown-preview.nvim',
		run = 'cd app && npm install',
		setup = function()
			vim.g.mkdp_filetypes = { 'markdown' }
		end,
		ft = {'markdown'},
	}
	use {																		-- nvim file explorer
		'nvim-tree/nvim-tree.lua',
		requires = {
			'nvim-tree/nvim-web-devicons',
		},
	}
	use 'preservim/nerdcommenter'						-- block commenting
	use 'preservim/tagbar'									-- tagbar
	use 'nvim-lualine/lualine.nvim'					-- statusline
	use 'glepnir/dashboard-nvim'

	-- colorschemes
	use 'folke/tokyonight.nvim'
  use {
		"catppuccin/nvim", as = "catppuccin"
	}

	-- treesitter
	use {
		'nvim-treesitter/nvim-treesitter',
		run = ":TSUpdate"
	}

	-- telescope
	use { 																	-- Fuzzy finder plugin
		'nvim-telescope/telescope.nvim',
		tag = '0.1.0',
		requires = { { 'nvim-lua/plenary.nvim'} }
	}
	use 'BurntSushi/ripgrep'								-- dependency
	use 'sharkdp/fd'												-- dependency

	-- LSP
	use 'williamboman/mason.nvim'						-- LSP installer
	use 'williamboman/mason-lspconfig.nvim' -- Recommended plugin with lspconfig
	use 'neovim/nvim-lspconfig'							-- LSP configuration
	use 'mfussenegger/nvim-jdtls'           -- LSP extensions for eclipse.jdt.ls
	use 'mfussenegger/nvim-dap'             -- Debug Adapter Protocol plugin
	use 'onsails/lspkind-nvim'              -- Formatting plugin



	-- cmp plugins
	use 'hrsh7th/nvim-cmp'                  -- Autocompletion plugin
	use 'hrsh7th/cmp-buffer'                -- Autocompletion source
	use 'hrsh7th/cmp-path'                  -- Autocompletion source
	use 'hrsh7th/cmp-nvim-lsp'              -- Autocompletion source
	use 'hrsh7th/cmp-nvim-lua'              -- Autocompletion source
	use 'hrsh7th/cmp-cmdline'               -- Autocompletion source
	use 'saadparwaiz1/cmp_luasnip'					-- Snippets src for nvim-cmp
	use 'L3MON4D3/LuaSnip'									-- Snippets plugin


end)
