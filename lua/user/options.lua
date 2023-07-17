vim.bo.autoindent = true

vim.opt.termguicolors = true

-- NOTE: Linewidth
vim.wo.cc = "80"

-- NOTE: Highlight current line
vim.wo.cursorline = true

-- NOTE: Highlight search results
vim.go.hlsearch = true

-- NOTE: Ignore case when searching
vim.go.ignorecase = true

-- NOTE: Search incrementally (traverse between results with n/N)
vim.go.incsearch = true

-- NOTE: Split screen buffers
vim.go.splitright = true
vim.go.splitbelow = true

-- NOTE: Count relative to current line
vim.wo.relativenumber = true

-- NOTE: Expand tabs to spaces
vim.bo.expandtab = true

-- NOTE: This sets the clipboard to global
vim.go.clipboard = "unnamedplus"

-- WARNING: Testing this for image.nvim
vim.opt.conceallevel = 2
vim.opt.signcolumn = "yes:2"

-- NOTE: Show number of current line
vim.wo.number = true
vim.g.syntax_on = true

-- WARNING: Set for 'livepreview'
vim.o.backupcopy = 'yes'

-- NOTE: Only fold 3rd level
vim.cmd('set foldlevel=3')
-- NOTE: Fold using treesitter
vim.cmd('set foldmethod=expr')
vim.cmd('set foldexpr="nvim_treesitter#foldexpr()"')
-- NOTE: Start with no fold
vim.cmd('set foldlevelstart=99')

-- WARNING: This was set for jdtls
vim.cmd('filetype plugin on')

-- NOTE: Overriding default nvim sql support
vim.cmd("let g:ftplugin_sql_omni_key = '<C-p>'")

-- NOTE: Colorscheme
vim.g.catppuccin_flavour = 'mocha'
vim.api.nvim_command("colorscheme catppuccin")

-- NOTE: Vimtex pdf viewer
vim.g.vimtex_view_method = "sioyek"
vim.g.vimtex_compiler_latexmk = {
	out_dir = 'out'
}

-- NOTE: Codeium settings
vim.g.codeium_disable_bindings = 1
vim.g.codeium_render = false
