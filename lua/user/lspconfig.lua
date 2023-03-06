local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)

local lspconfig = require('lspconfig')
lspconfig['lua_ls'].setup {
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
lspconfig['pylsp'].setup {
	capabilities = capabilities
}
lspconfig['jsonls'].setup {
	capabilities = capabilities
}
lspconfig['marksman'].setup {
	capabilities = capabilities
}
lspconfig['bashls'].setup {
	capabilities = capabilities
}
lspconfig['dockerls'].setup {
	capabilities = capabilities
}
lspconfig['tsserver'].setup {
	capabilities = capabilities,
}
--lspconfig['eslint'].setup {
--capabilities = capabilities,
--filetypes = { "javascript" }
--}
lspconfig['texlab'].setup {
	capabilities = capabilities
}
lspconfig['clangd'].setup {
	capabilities = capabilities
}
lspconfig['cssls'].setup {
	capabilities = capabilities,
	indent = false,
}
-- html lsp server is not needed since it
-- doesn't provide formatting or diagnostics

--lspconfig['html'].setup {
--capabilities = capabilities,
--}
lspconfig['spectral'].setup {
	capabilities = capabilities
}
lspconfig['emmet_ls'].setup {
	capabilities = capabilities,
	--capabilities.textDocument.completion.completionItem.snippetSupport = true
	filetypes = { 'html', 'typescriptreact', 'javascriptreact', 'css', 'sass', 'scss', 'less' },
	init_options = {
		html = {
			options = {
				-- For possible options, see: https://github.com/emmetio/emmet/blob/master/src/config.ts#L79-L267
				["bem.enabled"] = true,
			},
		},
	}
}
lspconfig['sqls'].setup {
	on_attach = function(client, bufnr)
		require('sqls').on_attach(client, bufnr)
	end,
	--capabilities = capabilities,
}
