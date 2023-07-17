-- Source lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- Source keybindings (mainly to ensure leader is set before plugins are loaded)
require('user.keymaps')

-- Source plugin table
local packages = require('user.packages')

-- Load plugins
require("lazy").setup(packages)

-- Source the rest of the configs
require('user.whichkey')
require('user.indent-blankline')
require('user.options')
require('user.lualine')
require('user.treesitter')
require('user.lspkind')
require('user.mason')
require('user.luasnip')
require('user.cmp')
require('user.lspconfig')
--require('user.nvim-lint')
require("user.possession")
require("user.noice")
require('user.telescope')
