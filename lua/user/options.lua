vim.bo.autoindent = true
vim.wo.cc = "80"
vim.wo.cursorline = true
vim.go.hlsearch = true
vim.go.ignorecase = true
vim.go.incsearch = true
vim.go.splitright = true
vim.go.splitbelow = true
vim.wo.relativenumber = true
vim.bo.expandtab = true
vim.go.clipboard = "unnamedplus"
--vim.bo.tabstop = 2
vim.bo.shiftwidth = 2
vim.bo.softtabstop = 2
vim.cmd[[ colorscheme tokyonight ]]
vim.wo.number = true
vim.g.syntax_on = true
vim.g.vimtex_view_method = 'sioyek'
vim.o.backupcopy = 'yes'
--vim.opt.foldlevel = 1
vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
vim.cmd('filetype plugin on')


vim.g.catppuccin_flavour = 'mocha'
require('catppuccin').setup()
vim.api.nvim_command("colorscheme catppuccin")
require('colorizer').setup()
