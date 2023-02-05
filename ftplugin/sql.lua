local wk = require("which-key")
local opts = { noremap = true, silent = true, prefix = "<leader>", buffer = 0 }

wk.register({
	["<leader>lf"] = { "<cmd>!sqlfluff fix --dialect postgres --force %<cr>", "Format" },
	["<leader>ll"] = { "<cmd>!sqlfluff lint --dialect postgres %<cr>", "Lint" }
}, opts)

