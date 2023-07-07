--vim.opt_local.shiftwidth = 4
--vim.opt_local.tabstop = 4
--vim.opt_local.cmdheight = 4

local wk = require("which-key")
local opts = { noremap = true, silent = true, buffer = 0 }

wk.register({
	--["<leader>lf"] = { "<cmd>!sqlformat % --output %<cr>", "Format" },
	--["<leader>ll"] = { "<cmd>!sqlfluff lint --dialect postgres %<cr>", "Lint" }
	--["<leader>lf"] = { "<cmd>!sqlfluff fix --config ~/.config/sqlfluff/.sqlfluff --dialect postgres --force %<cr>", "Format" },
	["<leader>lf"] = { "<cmd>!sqlfluff fix --dialect postgres --force %<cr>", "Format" },
	--["<leader>ll"] = { "<cmd>!sqlfluff lint --config ~/.config/sqlfluff/.sqlfluff --dialect postgres %<cr>", "Lint" }
	["<leader>ll"] = { "<cmd>!sqlfluff lint --dialect postgres %<cr>", "Lint" },
	["<leader>eq"] = { "<cmd>SqlsExecuteQuery<cr>", "Execute selected query" }
}, opts)

wk.register({
	["<leader>eq"] = { "<cmd>SqlsExecuteQuery<cr>", "Execute selected query" }
}, { noremap = true, silent = true, mode = { "v", "x" } })

