local lint = require('lint')

lint.linters_by_ft = {
  markdown = {'markdownlint'},
}

vim.api.nvim_create_autocmd({ "BufWritePost" }, {
  callback = function()
    require("lint").try_lint()
  end,
})
vim.api.nvim_create_autocmd({ "BufRead" }, {
  callback = function()
    require("lint").try_lint()
  end,
})
