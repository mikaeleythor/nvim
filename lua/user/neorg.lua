return {
	load = {
		["core.defaults"] = {}, -- Loads default behaviour
		["core.concealer"] = {}, -- Adds pretty icons to your documents
		["core.summary"] = {},
		["core.dirman"] = { -- Manages Neorg workspaces
			config = {
				workspaces = {
					school = "~/Documents/notes/school",
					linux = "~/Documents/notes/linux",
					work = "~/Documents/notes/work",
				},
				default_workspace = "linux",
			},
		},
		["core.looking-glass"] = {},
		-- HACK: Localleader keybinds
		["core.keybinds"] = {
			config = {
				hook = function(keybinds)
					keybinds.map("norg", "n", "<localleader>fi",
						"<cmd>Neorg index<CR>")
					keybinds.map("norg", "n", "<localleader>jt",
						"<cmd>Neorg journal toc<CR>")
					keybinds.map("norg", "n", "<localleader>jd",
						"<cmd>Neorg journal today<CR>")
					keybinds.map("norg", "n", "<localleader>jy",
						"<cmd>Neorg journal yesterday<CR>")
					keybinds.map("norg", "n", "<localleader>jm",
						"<cmd>Neorg journal tomorrow<CR>")
					keybinds.map("norg", "n", "<localleader>jt",
						"<cmd>Neorg journal toc<CR>")
					keybinds.map("norg", "n", "<localleader>fl",
						"<cmd>Neorg keybind all core.looking-glass.magnify-code-block<CR>")
					keybinds.map("norg", "n", "<localleader>b", "I*<ESC>A*<ESC>")
				end,
			}
		}
	},
}
