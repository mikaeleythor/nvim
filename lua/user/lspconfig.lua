local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)

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
