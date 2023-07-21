-- NOTE: This was set for a livepreview
vim.o.backupcopy = 'yes'
vim.g.syntax_on = true

-- NOTE: Override this in ftplugin/.. if necessary
vim.bo.tabstop = 2
vim.bo.shiftwidth = 2
vim.bo.expandtab = false
vim.wo.cc = "80"
vim.wo.cursorline = true
vim.wo.relativenumber = true
vim.wo.number = true
vim.go.hlsearch = true
vim.go.ignorecase = true
vim.go.incsearch = true
vim.go.splitright = true
vim.go.splitbelow = true
vim.go.clipboard = "unnamedplus"
vim.opt.termguicolors = true

-- NOTE: Taken from catppuccin docs
vim.g.catppuccin_flavour = 'mocha'
vim.api.nvim_command("colorscheme catppuccin")

-- WARNING: Testing this for image.nvim
vim.opt.conceallevel = 2
vim.opt.signcolumn = "yes:2"

-- WARNING: Works now don't touch!
vim.cmd('set foldlevel=3')
vim.cmd('set foldmethod=expr')
vim.cmd('set foldexpr="nvim_treesitter#foldexpr()"')
vim.cmd('set foldlevelstart=99')

vim.cmd('filetype plugin on') -- NOTE: This was set for jdtls at some point
vim.cmd("let g:ftplugin_sql_omni_key = '<C-p>'") -- NOTE: Better than <c-c>

-- NOTE: Set diagnostics Icons
local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }
for type, icon in pairs(signs) do
  local hl = "DiagnosticSign" .. type
  vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end
