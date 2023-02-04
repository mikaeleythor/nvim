return {
	theme = "doom",
	config = {
		header = {
			"                                                                                                       ",
			"                                                                                                       ",
			"                                                                                                       ",
			"                                                                                                       ",
			"                                                                                                       ",
			"                                                                                                       ",
			"                                                                                                       ",
			"                                                                                                       ",
			" ██╗    ██╗ ███████╗ ██╗      ██╗      ██████╗     ███████╗ ███████╗  ██╗ ███████╗ ███╗   ██╗ ███████╗ ",
			" ██║    ██║ ██╔════╝ ██║      ██║     ██╔═══██╗    ██╔════╝ ██╔═══██╗ ██║ ██╔════╝ ████╗  ██║ ██╔═══██╗",
			" █████████║ █████╗   ██║      ██║     ██║   ██║    █████╗   ███████╔╝ ██║ █████╗   ██╔██╗ ██║ ██║   ██║",
			" ██╔════██║ ██╔══╝   ██║      ██║     ██║   ██║    ██╔══╝   ██╔═══██╗ ██║ ██╔══╝   ██║╚██╗██║ ██║   ██║",
			" ██║    ██║ ███████╗ ███████╗ ███████╗╚██████╔╝    ██║      ██║   ██║ ██║ ███████╗ ██║ ╚████║ ███████╔╝",
			" ╚═╝    ╚═╝ ╚══════╝ ╚══════╝ ╚══════╝ ╚═════╝     ╚═╝      ╚═╝   ╚═╝ ╚═╝ ╚══════╝ ╚═╝  ╚═══╝ ╚══════╝ ",
			"                                                                                                       ",
			"                                                                                                       ",
			"                                                                                                       ",
			"                                                                                                       ",
		}, --your header
		center = {
			{
				icon = " ",
				icon_hl = "Title",
				desc = "Find File           ",
				desc_hl = "String",
				key = "f",
				keymap = "SPC f f",
				--key_hl = "Number",
				action = "Telescope find_files",
			},
			{
				icon = " ",
				icon_hl = "Title",
				desc = "Recently opened files                   ",
				desc_hl = "String",
				action = "Telescope oldfiles",
				key = "o",
				keymap = "SPC f r",
			},
			{
				icon = " ",
				icon_hl = "Title",
				desc = "New File                                ",
				desc_hl = "String",
				key = "n",
				keymap = "SPC f n",
				action = "enew",
			},
			{
				icon = " ",
				icon_hl = "Title",
				desc = "Find Dotfiles",
				desc_hl = "String",
				key = "d",
				keymap = "SPC f d",
				action = ":e ~/.config/nvim",
			},
			{
				icon = 'm ',
				icon_hl = "Title",
				desc = "Update plugins",
				desc_hl = "String",
				key = "u",
				keymap = "SPC p u",
				action = "PackerSync"
			}
		},
		footer = { "yummers" }, --your footer
	},
}

--}
