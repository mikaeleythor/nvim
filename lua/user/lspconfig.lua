local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)

vim.cmd([[autocmd! ColorScheme * highlight NormalFloat guibg=#1f2335]])
vim.cmd([[autocmd! ColorScheme * highlight FloatBorder guifg=white guibg=#1f2335]])

local border = {
	{ "┌", "FloatBorder" },
	{ "─", "FloatBorder" },
	{ "┐", "FloatBorder" },
	{ "│", "FloatBorder" },
	{ "┘", "FloatBorder" },
	{ "─", "FloatBorder" },
	{ "└", "FloatBorder" },
	{ "│", "FloatBorder" },
}

-- Add the border on hover and on signature help popup window
local handlers = {
	["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { border = border }),
	["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, { border = border }),
}

-- NOTE: Neodev must be set up before lspconfig
require("neodev").setup({})
local lspconfig = require("lspconfig")
lspconfig["lua_ls"].setup({
	handlers = handlers,
	capabilities = capabilities,
	settings = {
		Lua = {
			runtime = {
				-- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
				version = "LuaJIT",
			},
			diagnostics = {
				-- Get the language server to recognize the `vim` global
				globals = { "vim", "use" },
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
})
lspconfig["pylsp"].setup({
	handlers = handlers,
	capabilities = capabilities,
})
lspconfig["jsonls"].setup({
	handlers = handlers,
	capabilities = capabilities,
})
lspconfig["marksman"].setup({
	handlers = handlers,
	capabilities = capabilities,
})

lspconfig["bashls"].setup({
	handlers = handlers,
	capabilities = capabilities,
})
lspconfig["dockerls"].setup({
	handlers = handlers,
	capabilities = capabilities,
})
lspconfig["tsserver"].setup({
	handlers = handlers,
	capabilities = capabilities,
})
lspconfig["texlab"].setup({
	handlers = handlers,
	capabilities = capabilities,
})
lspconfig["clangd"].setup({
	handlers = handlers,
	capabilities = capabilities,
})
lspconfig["cssls"].setup({
	handlers = handlers,
	capabilities = capabilities,
	indent = false,
})
lspconfig["spectral"].setup({
	handlers = handlers,
	capabilities = capabilities,
})
lspconfig["emmet_ls"].setup({
	handlers = handlers,
	capabilities = capabilities,
	--capabilities.textDocument.completion.completionItem.snippetSupport = true
	filetypes = { "html", "typescriptreact", "javascriptreact", "css", "sass", "scss", "less" },
	init_options = {
		html = {
			options = {
				-- For possible options, see: https://github.com/emmetio/emmet/blob/master/src/config.ts#L79-L267
				["bem.enabled"] = true,
			},
		},
	},
})

-- When the arduino server starts in these directories, use the provided FQBN.
-- Note that the server needs to start exactly in these directories.
-- This example would require some extra modification to support applying the FQBN on subdirectories!
local my_arduino_fqbn = {
	["/home/cinder/engx/3week/data-transmission"] = "arduino:avr:feather32u4",
}

local DEFAULT_FQBN = "arduino:avr:feather32u4"

lspconfig.arduino_language_server.setup({
	handlers = handlers,
	on_new_config = function(config, root_dir)
		local fqbn = my_arduino_fqbn[root_dir]
		if not fqbn then
			vim.notify(("Could not find which FQBN to use in %q. Defaulting to %q."):format(root_dir, DEFAULT_FQBN))
			fqbn = DEFAULT_FQBN
		end
		config.cmd = {
			"arduino-language-server",
			"-cli-config",
			"/home/cinder/.arduino15/arduino-cli.yaml",
			"-fqbn",
			fqbn,
		}
	end,
})

lspconfig["vimls"].setup({
	capabilities = capabilities,
})

lspconfig["ltex"].setup({})
lspconfig["matlab_ls"].setup({
	handlers = handlers,
	capabilities = capabilities,
})
lspconfig["sqls"].setup{
    on_attach = function(client, bufnr)
        require('sqls').on_attach(client, bufnr)
    end,
}
lspconfig["sqlls"].setup({
	handlers = handlers,
	capabilities = capabilities,
})
lspconfig["awk_ls"].setup({
	handlers = handlers,
	capabilities = capabilities,
})
