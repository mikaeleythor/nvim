vim.opt.list = true
vim.g.indentLine_fileTypeExclude = { 'dashboard', 'norg' }

require("indent_blankline").setup {
    space_char_blankline = " ",
    show_current_context = true,
}
