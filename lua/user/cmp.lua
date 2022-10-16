local cmp = require 'cmp'
local luasnip = require 'luasnip'

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
