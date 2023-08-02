local cmp = require 'cmp'
local luasnip = require 'luasnip'

require("nvim-autopairs").setup {}
local cmp_autopairs = require("nvim-autopairs.completion.cmp")

local has_words_before = function()
	unpack = unpack or table.unpack
	local line, col = unpack(vim.api.nvim_win_get_cursor(0))
	return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
end

cmp.setup {

	-- Snippet engine is not built into cmp
	snippet = {
		expand = function(args)
			luasnip.lsp_expand(args.body)
		end,
	},


	mapping = {
		['<C-d>'] = cmp.mapping.scroll_docs( -4),
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
					vim.api.nvim_feedkeys(('<Down>'), 'n', true)
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
					vim.api.nvim_feedkeys(('<Up>'), 'n', true)
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
		['<C-Space>'] = cmp.mapping(function(fallback)
			if luasnip.expand_or_jumpable() then
				luasnip.expand_or_jump()
			elseif has_words_before() then
				cmp.complete()
			else
				fallback()
			end
		end, { "i", "s" }),

		--["<Tab>"] = cmp.mapping(function(fallback)
		--if cmp.visible() then
		--cmp.select_next_item()
		---- You could replace the expand_or_jumpable() calls with expand_or_locally_jumpable()
		---- they way you will only jump inside the snippet region
		--elseif luasnip.expand_or_jumpable() then
		--luasnip.expand_or_jump()
		--elseif has_words_before() then
		--cmp.complete()
		--else
		--fallback()
		--end
		--end, { "i", "s" }),

		--["<S-Tab>"] = cmp.mapping(function(fallback)
		--if cmp.visible() then
		--cmp.select_prev_item()
		--elseif luasnip.jumpable(-1) then
		--luasnip.jump(-1)
		--else
		--fallback()
		--end
		--end, { "i", "s" }),
	},

	sources = cmp.config.sources({
		{ name = 'luasnip' },
		{ name = 'codeium', keyword_length = 5 },
		{ name = 'nvim_lsp' },
		{ name = 'nvim_lua' },
		{ name = 'path', max_items_count = 4 },
		{ name = 'buffer', max_items_count = 4,  keyword_length = 5 },
	}),

	formatting = {
		format = require('lspkind').cmp_format {
			mode = 'symbol_text',
			maxwidth = 50,
			menu = {
				buffer = "[󰈔]",
				nvim_lsp = "[]",
				nvim_lua = "[]",
				path = "[󰉋]",
				luasnip = "[󰆦]",
				Codeium = "[󰧑]",
			},
		},
	},

	experimental = {
		ghost_text = true
	}
}

cmp.setup.cmdline('/', {
	sources = cmp.config.sources({
		{ name = 'buffer' }
	})
})

cmp.setup.cmdline(':', {
	sources = cmp.config.sources({
		{ name = 'path' },
		{ name = 'cmdline' },
	})
})

cmp.event:on(
	'confirm_done',
	cmp_autopairs.on_confirm_done()
)
