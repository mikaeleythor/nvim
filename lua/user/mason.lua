require("mason").setup()
require("mason-lspconfig").setup({
	ensure_installed = {
		--"sqlls",
		--"pylsp",
		--"eslint",
		--"html", --, "stylua", "prettier", "autopep8"
	},
})
local null_ls = require("null-ls")
local my_sources = {
	--null_ls.builtins.formatting.stylua,
	null_ls.builtins.formatting.prettier, -- This works out-of-box with css
	--null_ls.builtins.formatting.sqlformat,
	--null_ls.builtins.diagnostics.codespell,
	--null_ls.builtins.diagnostics.eslint_d,
	--null_ls.builtins.diagnostics.gitlint,
	null_ls.builtins.diagnostics.mlint,
	--null_ls.builtins.diagnostics.shellcheck,
	null_ls.builtins.formatting.beautysh,
	--null_ls.builtins.diagnostics.yamllint,
	--null_ls.builtins.diagnostics.zsh,
	--null_ls.builtins.formatting.beautysh,
	--null_ls.builtins.formatting.eslint,
	--null_ls.builtins.hover.dictionary,
	null_ls.builtins.diagnostics.sqlfluff.with({
		extra_args = { "--dialect", "postgres" }, -- change to your dialect
	}),
	null_ls.builtins.formatting.sqlfluff.with({
		extra_args = { "--dialect", "postgres" }, -- change to your dialect
	}),
}
null_ls.setup({
	sources = my_sources
})
