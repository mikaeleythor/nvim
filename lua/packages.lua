require('packer').startup(function()
	use 'wbthomason/packer.nvim'		-- Package manager
	use 'nvim-treesitter/nvim-treesitter'	-- Syntax HL and indentation
	use 'scrooloose/nerdtree'		-- DirTree
	use 'preservim/nerdcommenter'		-- Block commenting
	use 'preservim/tagbar'			-- Tagbar
	use 'nvim-lualine/lualine.nvim'		-- Statusline
	use 'ryanoasis/vim-devicons'		-- Icons for DirTree
	use 'williamboman/mason.nvim'		-- LSP installer
	use 'williamboman/mason-lspconfig.nvim' -- Recommended plugin with lspconfig
	use 'neovim/nvim-lspconfig'		-- LSP configuration
	use 'hrsh7th/nvim-cmp'                  -- Autocompletion plugin
	use 'hrsh7th/cmp-buffer'                -- Autocompletion source
	use 'hrsh7th/cmp-path'                  -- Autocompletion source
	use 'hrsh7th/cmp-nvim-lsp'              -- Autocompletion source
	use 'hrsh7th/cmp-nvim-lua'              -- Autocompletion source
	use 'hrsh7th/cmp-cmdline'               -- Autocompletion source
	use 'saadparwaiz1/cmp_luasnip'		-- Snippets src for nvim-cmp
	use 'L3MON4D3/LuaSnip'			-- Snipptes plugin
	use 'folke/tokyonight.nvim'             -- Colorscheme
	use 'mfussenegger/nvim-jdtls'           -- LSP extensions for eclipse.jdt.ls
	use 'mfussenegger/nvim-dap'             -- Debug Adapter Protocol plugin
	use 'onsails/lspkind-nvim'              -- Formatting plugin
	use 'windwp/nvim-autopairs'           	-- Autoclosing brackets plugin
	use 'glepnir/dashboard-nvim'
	use {
		-- Fuzzy finder plugin
		'nvim-telescope/telescope.nvim', 
		tag = '0.1.0',
		requires = { { 'nvim-lua/plenary.nvim'} }
	}
	use 'BurntSushi/ripgrep'
	use 'sharkdp/fd'
	use 'lervag/vimtex'
	use {
		'iamcco/markdown-preview.nvim',
		run = 'cd app && npm install',
		setup = function() 
			vim.g.mkdp_filetypes = { 'markdown' }
		end,
		ft = {'markdown'},
	}
end)
