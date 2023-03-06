local lint = require('lint')
lint.linters_by_ft = {
  markdown = {'vale'},
}
vim.cmd("au BufWritePost lua require('lint').try_lint()")
