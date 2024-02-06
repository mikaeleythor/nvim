require("mason").setup()
require("mason-lspconfig").setup({
	ensure_installed = {
		"spectral",
		"lua_ls",
		"marksman"

		--"html", --, "stylua", "prettier", "autopep8"
	},
})
