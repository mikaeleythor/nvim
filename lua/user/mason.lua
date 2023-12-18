require("mason").setup()
require("mason-lspconfig").setup({
	ensure_installed = {
		--"sqlls",
		--"pylsp",
		--"eslint",
		--"html", --, "stylua", "prettier", "autopep8"
	},
})
