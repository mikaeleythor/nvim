vim.bo.autoindent = true

vim.opt.termguicolors = true

-- Linewidth
vim.wo.cc = "80"

-- Highlight current line
vim.wo.cursorline = true

-- Highlight search results
vim.go.hlsearch = true

-- Ignore case when searching
vim.go.ignorecase = true

-- Search incrementally (traverse between results with n/N)
vim.go.incsearch = true

-- Split screen buffers
vim.go.splitright = true
vim.go.splitbelow = true

-- Count relative to current line
vim.wo.relativenumber = true

-- Expand tabs to spaces
vim.bo.expandtab = true

-- This sets the clipboard to global
vim.go.clipboard = "unnamedplus"

-- Show number of current line
vim.wo.number = true
vim.g.syntax_on = true

-- Important for livepreview
vim.o.backupcopy = 'yes'

-- Fold second nesting
vim.opt.foldlevel = 2
vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "nvim_treesitter#foldexpr()"

-- This was set for jdtls i think
vim.cmd('filetype plugin on')

-- Really annoying having this as <c-c>
vim.cmd("let g:ftplugin_sql_omni_key = '<C-p>'")

-- Colorscheme
vim.g.catppuccin_flavour = 'mocha'
vim.api.nvim_command("colorscheme catppuccin")

-- Vimtex pdf viewer
vim.g.vimtex_view_method = "sioyek"

vim.g.indentLine_fileTypeExclude = {'dashboard', 'startify'}
