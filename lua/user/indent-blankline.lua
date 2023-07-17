vim.opt.list = true
--vim.opt.listchars:append "space:⋅"
--vim.opt.listchars:append "eol:↴"

require("indent_blankline").setup {
    space_char_blankline = " ",
    show_current_context = true,
    --show_current_context_start = true,
}
vim.g.indentLine_fileTypeExclude = { 'dashboard', 'startify' }
