require('keybindings')
require('packages')
require('options')

local db = require('dashboard')

db.custom_header = {
	'                                                                                                       ',
	'                                                                                                       ',
	'                                                                                                       ',
	' ██╗    ██╗ ███████╗ ██╗      ██╗      ██████╗     ███████╗ ███████╗  ██╗ ███████╗ ███╗   ██╗ ███████╗ ',
	' ██║    ██║ ██╔════╝ ██║      ██║     ██╔═══██╗    ██╔════╝ ██╔═══██╗ ██║ ██╔════╝ ████╗  ██║ ██╔═══██╗',
	' █████████║ █████╗   ██║      ██║     ██║   ██║    █████╗   ███████╔╝ ██║ █████╗   ██╔██╗ ██║ ██║   ██║',
	' ██╔════██║ ██╔══╝   ██║      ██║     ██║   ██║    ██╔══╝   ██╔═══██╗ ██║ ██╔══╝   ██║╚██╗██║ ██║   ██║',
	' ██║    ██║ ███████╗ ███████╗ ███████╗╚██████╔╝    ██║      ██║   ██║ ██║ ███████╗ ██║ ╚████║ ███████╔╝',
	' ╚═╝    ╚═╝ ╚══════╝ ╚══════╝ ╚══════╝ ╚═════╝     ╚═╝      ╚═╝   ╚═╝ ╚═╝ ╚══════╝ ╚═╝  ╚═══╝ ╚══════╝ ',
	'                                                                                                       ',
	'                                                                                                       ',
	'                                                                                                       ',
	'                                                                                                       ',
}

db.custom_center = {
	{ icon = '  ',
		desc = 'Recently latest session                  ',
		shortcut = 'SPC s l',
		action = 'SessionLoad' },
	{ icon = '  ',
		desc = 'Recently opened files                   ',
		action = 'Telescope oldfiles',
		shortcut = 'SPC f h' },
	{ icon = '  ',
		desc = 'Find  File                              ',
		action = ':Telescope find_files',
		shortcut = 'SPC f f' },
	--{ icon = '  ',
	--desc = 'File Browser                            ',
	--action = 'Telescope file_browser',
	--shortcut = 'SPC f b' },
	{ icon = '  ',
		desc = 'Find  word                              ',
		action = 'Telescope live_grep',
		shortcut = 'SPC f g' },
	--{ icon = '  ',
	--desc = 'Open Personal dotfiles                  ',
	--action = 'Telescope dotfiles path=' .. home .. '/.dotfiles',
	--shortcut = 'SPC f d' },
}


local configs = require 'nvim-treesitter.configs'

configs.setup {
	ensure_installed = {
		maintained = true,
	},
	highlight = {
		enable = true,
	},
	indent = {
		enable = false,
	}
}

--vim.opt.foldlevel = 1
vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "nvim_treesitter#foldexpr()"

require('lualine').setup {
	options = {
		icons_enabled = true,
		theme = 'auto',
		component_separators = { left = '', right = '' },
		section_separators = { left = '', right = '' },
		disabled_filetypes = {},
		always_divide_middle = true,
		globalstatus = false,
	},
	sections = {
		lualine_a = { 'mode' },
		lualine_b = { 'branch', 'diff', 'diagnostics' },
		lualine_c = { 'filename' },
		lualine_x = { 'encoding', 'fileformat', 'filetype' },
		lualine_y = { 'progress' },
		lualine_z = { 'location' }
	},
	inactive_sections = {
		lualine_a = {},
		lualine_b = {},
		lualine_c = { 'filename' },
		lualine_x = { 'location' },
		lualine_y = {},
		lualine_z = {}
	},
	tabline = {},
	extensions = {}
}

require("mason").setup()
require("mason-lspconfig").setup()

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').update_capabilities(capabilities)

-- Set up filetype plugins
vim.cmd('filetype plugin on')

require('lspkind').init({
	-- DEPRECATED (use mode instead): enables text annotations
	--
	-- default: true
	-- with_text = true,

	-- defines how annotations are shown
	-- default: symbol
	-- options: 'text', 'text_symbol', 'symbol_text', 'symbol'
	mode = 'symbol_text',

	-- default symbol map
	-- can be either 'default' (requires nerd-fonts font) or
	-- 'codicons' for codicon preset (requires vscode-codicons font)
	--
	-- default: 'default'
	preset = 'codicons',

	-- override preset symbols
	--
	-- default: {}
	symbol_map = {
		Text = "",
		Method = "",
		Function = "",
		Constructor = "",
		Field = "ﰠ",
		Variable = "",
		Class = "ﴯ",
		Interface = "",
		Module = "",
		Property = "ﰠ",
		Unit = "塞",
		Value = "",
		Enum = "",
		Keyword = "",
		Snippet = "",
		Color = "",
		File = "",
		Reference = "",
		Folder = "",
		EnumMember = "",
		Constant = "",
		Struct = "פּ",
		Event = "",
		Operator = "",
		TypeParameter = ""
	},
})
require('lspconfig')['jdtls'].setup {
	capabilities = capabilities
}
require('lspconfig')['sumneko_lua'].setup {
	capabilities = capabilities,
	settings = {
		Lua = {
			runtime = {
				-- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
				version = 'LuaJIT',
			},
			diagnostics = {
				-- Get the language server to recognize the `vim` global
				globals = { 'vim', 'use' }
			},
			workspace = {
				-- Make the server aware of Neovim runtime files
				library = vim.api.nvim_get_runtime_file("", true),
			},
			-- Do not send telemetry data containing a randomized but unique identifier
			telemetry = {
				enable = false,
			},
		},
	},
}
require('lspconfig')['pyright'].setup {
	capabilities = capabilities
}
require('lspconfig')['jsonls'].setup {
	capabilities = capabilities
}
require('lspconfig')['marksman'].setup {
	capabilities = capabilities
}
require('lspconfig')['bashls'].setup {
	capabilities = capabilities
}
require('lspconfig')['dockerls'].setup {
	capabilities = capabilities
}
require('lspconfig')['eslint'].setup {
	capabilities = capabilities
}
require('lspconfig')['texlab'].setup {
	capabilities = capabilities
}
require('lspconfig')['clangd'].setup {
	capabilities = capabilities
}
require('lspconfig')['cssls'].setup {
	capabilities = capabilities
}

-- Set up format-on-save
--vim.api.nvim_command [[autocmd BufWritePre * lua vim.lsp.buf.formatting_sync()]]

local cmp = require 'cmp'
local luasnip = require 'luasnip'

-- Set up nvim-autopairs
require("nvim-autopairs").setup {}
local cmp_autopairs = require("nvim-autopairs.completion.cmp")

cmp.setup {

	-- Snippet engine is not built into cmp
	snippet = {
		expand = function(args)
			luasnip.lsp_expand(args.body)
		end,
	},

	mapping = {
		['<C-d>'] = cmp.mapping.scroll_docs(-4),
		['<C-f>'] = cmp.mapping.scroll_docs(4),
		['<C-e>'] = cmp.mapping.close(),
		['<C-y>'] = cmp.mapping.confirm {
			behavior = cmp.ConfirmBehavior.Replace,
			select = true,
		},
		['<C-n>'] = cmp.mapping({
			c = function()
				if cmp.visible() then
					cmp.select_next_item({ behavior = cmp.SelectBehavior.Select })
				else
					vim.api.nvim_feedkeys(t('<Down>'), 'n', true)
				end
			end,
			i = function(fallback)
				if cmp.visible() then
					cmp.select_next_item({ behavior = cmp.SelectBehavior.Select })
				else
					fallback()
				end
			end
		}),
		['<C-p>'] = cmp.mapping({
			c = function()
				if cmp.visible() then
					cmp.select_prev_item({ behavior = cmp.SelectBehavior.Select })
				else
					vim.api.nvim_feedkeys(t('<Up>'), 'n', true)
				end
			end,
			i = function(fallback)
				if cmp.visible() then
					cmp.select_prev_item({ behavior = cmp.SelectBehavior.Select })
				else
					fallback()
				end
			end
		}),
		['<C-Space>'] = cmp.mapping.complete(),

		---- Set up tab completion
		--['<Tab>'] = cmp.mapping(function(fallback)
		--if cmp.visible() then
		--cmp.select_next_item()
		--elseif luasnip.expand_or_jumpable() then
		--luasnip.expand_or_jump()
		--else
		--fallback()
		--end
		--end, { 'i', 's' }),

		---- Set up shift-tab mapping
		--['<S-Tab>'] = cmp.mapping(function(fallback)
		--if cmp.visible() then
		--cmp.select_prev_item()
		--elseif luasnip.jumpable(-1) then
		--luasnip.jump(-1)
		--else
		--fallback()
		--end
		--end, { 'i', 's' }),
	},

	-- TODO: Configure max_item_count
	sources = {
		{ name = 'nvim_lua' },
		{ name = 'nvim_lsp' },
		{ name = 'path' },
		{ name = 'luasnips' },
		{ name = 'buffer', keyword_length = 5 },
	},

	formatting = {
		format = require('lspkind').cmp_format {
			mode = 'symbol_text',
			maxwidth = 50,
			menu = {
				buffer = "[buf]",
				nvim_lsp = "[LSP]",
				nvim_lua = "[api]",
				path = "[path]",
				luasnip = "[snip]",
			},
		},
	},

}

cmp.setup.cmdline('/', {
	sources = {
		{ name = 'buffer' }
	}
})

cmp.setup.cmdline(':', {
	sources = {
		{ name = 'path' },
		{ name = 'cmdline' },
	}
})

cmp.event:on(
	'confirm_done',
	cmp_autopairs.on_confirm_done()
)

require('telescope').setup()
