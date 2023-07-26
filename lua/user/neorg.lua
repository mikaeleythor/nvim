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
		["core.integrations.telescope"] = {},
		["external.mermaid"] = {},
		["core.looking-glass"] = {},
		-- HACK: Localleader keybinds
		["core.keybinds"] = {
			config = {
				hook = function(keybinds)
					-- Binds the `gtd` key in `norg` mode to execute `:echo 'Hello'`
					keybinds.map("norg", "n", "<localleader>fi",
						"<cmd>Neorg index<CR>")
					keybinds.map("norg", "n", "<localleader>fh",
						"<cmd>Telescope neorg search_headings<CR>")
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
				end,
			}
		}
	},
	dependencies = { dir = "~/Desktop/lua/mermaid/module.lua" },
}
