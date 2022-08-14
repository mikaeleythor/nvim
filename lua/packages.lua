require('packer').startup(function()
	use 'wbthomason/packer.nvim'		-- Package manager
	use 'nvim-treesitter/nvim-treesitter'	-- Syntax HL and indentation
	use 'scrooloose/nerdtree'		-- DirTree
	use 'preservim/nerdcommenter'		-- Block commenting
	use 'preservim/tagbar'			-- Tagbar
	use 'nvim-lualine/lualine.nvim'		-- Statusline
	use 'ryanoasis/vim-devicons'		-- Icons for DirTree
	--use 'williamboman/nvim-lsp-installer'	-- LSP installer
	use 'williamboman/mason.nvim'		-- LSP installer
	use 'williamboman/mason-lspconfig.nvim' -- Recommended plugin with lspconfig
	use 'neovim/nvim-lspconfig'		-- LSP configuration
	use 'hrsh7th/cmp-nvim-lsp'
	use 'hrsh7th/cmp-buffer'
	use 'hrsh7th/cmp-path'
	use 'hrsh7th/cmp-cmdline'
	use 'hrsh7th/nvim-cmp'
	use 'saadparwaiz1/cmp_luasnip'		-- Snippets src for nvim-cmp
	use 'L3MON4D3/LuaSnip'			-- Snipptes plugin
	use 'folke/tokyonight.nvim'
	--use 'mfussenegger/nvim-jdtls'
end)
