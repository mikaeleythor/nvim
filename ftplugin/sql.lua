vim.opt_local.shiftwidth = 4
vim.opt_local.tabstop = 4
vim.opt_local.cmdheight = 4

local wk = require("which-key")
local opts = { noremap = true, silent = true, buffer = 0 }

wk.register({
	["æx"] = { "<cmd>SqlsExecuteQuery<cr>", "Execute script" }
}, opts)

wk.register({
	["æx"] = { ":'<,'>SqlsExecuteQuery<cr>", "Execute selected query" }
}, { noremap = true, silent = true, mode = { "v", "x" } })

