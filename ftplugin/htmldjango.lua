local wk = require("which-key")
local opts = { noremap = true, silent = true, buffer = 0 }

wk.register({
	["<leader>lf"] = { "<cmd>!python3 -m djlint --indent 2 --reformat %<cr>", "Format" },
	["<leader>ll"] = { "<cmd>!python3 -m djlint --lint %<cr>", "Format" },
	["<leader>eq"] = { "<cmd>SqlsExecuteQuery<cr>", "Execute selected query" }
}, opts)
