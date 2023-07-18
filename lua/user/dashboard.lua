local getKanyeQuote = function()
	local handle = io.popen('curl -s https://api.kanye.rest/ | awk -F \':\' \'{print $2}\' | sed \'s/["}]//g\'')
	local output = handle:read('*a')
	local quote = output:gsub('[\n\r]', ' ')
	handle:close()
	return quote
end

local quote = getKanyeQuote() or 'Old Kanye'
local M = {
	theme = "doom",
	config = {
		header = {
			"                                                                                                         ",
			"                                                                                                         ",
			"                                                                                                         ",
			"                                                                                                         ",
			"                                                                                                         ",
			"                                                                                                         ",
			" ██╗    ██╗ ███████╗ ██╗      ██╗      ██████╗       ███████╗ ███████╗  ██╗ ███████╗ ███╗   ██╗ ███████╗ ",
			" ██║    ██║ ██╔════╝ ██║      ██║     ██╔═══██╗      ██╔════╝ ██╔═══██╗ ██║ ██╔════╝ ████╗  ██║ ██╔═══██╗",
			" █████████║ █████╗   ██║      ██║     ██║   ██║      █████╗   ███████╔╝ ██║ █████╗   ██╔██╗ ██║ ██║   ██║",
			" ██╔════██║ ██╔══╝   ██║      ██║     ██║   ██║      ██╔══╝   ██╔═══██╗ ██║ ██╔══╝   ██║╚██╗██║ ██║   ██║",
			" ██║    ██║ ███████╗ ███████╗ ███████╗╚██████╔╝██╗   ██║      ██║   ██║ ██║ ███████╗ ██║ ╚████║ ███████╔╝",
			" ╚═╝    ╚═╝ ╚══════╝ ╚══════╝ ╚══════╝ ╚═════╝ ╚█║   ╚═╝      ╚═╝   ╚═╝ ╚═╝ ╚══════╝ ╚═╝  ╚═══╝ ╚══════╝ ",
			"                                                ╚╝                                                       ",
			"                                                                                                         ",
			"                                                                                                         ",
			"                                                                                                         ",
		}, --your header
		center = {
			{
				icon = " ",
				icon_hl = "Title",
				desc = "New File                                ",
				desc_hl = "String",
				key = "n",
				keymap = "SPC f n",
				key_hl = "Number",
				action = "enew",
			},
			{
				icon = " ",
				icon_hl = "Title",
				desc = "Find File           ",
				desc_hl = "String",
				key = "f",
				keymap = "SPC f f",
				key_hl = "Number",
				action = "Telescope find_files",
			},
			{
				icon = " ",
				icon_hl = "Title",
				desc = "Recently opened files                   ",
				desc_hl = "String",
				action = "Telescope oldfiles",
				key = "r",
				keymap = "SPC f r",
				key_hl = "Number",
			},
			{
				icon = " ",
				icon_hl = "Title",
				desc = "Neorg                                   ",
				desc_hl = "String",
				action = "tcd ~/Documents/notes/linux | Neorg workspace linux",
				key = "w",
				keymap = "SPC f w",
				key_hl = "Number",
			},
			{
				icon = " ",
				icon_hl = "Title",
				desc = "Most recent session                   ",
				desc_hl = "String",
				action = "SLoad",
				key = "m",
				keymap = "SPC s r",
				key_hl = "Number",
			},
			{
				icon = " ",
				icon_hl = "Title",
				desc = "List sessions                   ",
				desc_hl = "String",
				action = "Telescope possession list",
				key = "s",
				keymap = "SPC s l",
				key_hl = "Number",
			},
			{
				icon = " ",
				icon_hl = "Title",
				desc = "NVIM Config",
				desc_hl = "String",
				key = "l",
				keymap = "SPC f l",
				key_hl = "Number",
				action = "cd ~/.repos/nvim | Telescope find_files",
			},
			{
				icon = " ",
				icon_hl = "Title",
				desc = "Dotfiles",
				desc_hl = "String",
				key = "d",
				keymap = "SPC f d",
				key_hl = "Number",
				action = "cd ~/.repos/dotfiles | Telescope find_files",
			},
			{
				icon = " ",
				icon_hl = "Title",
				desc = "Shell Scripts",
				desc_hl = "String",
				key = "c",
				keymap = "SPC f c",
				key_hl = "Number",
				action = "cd ~/.repos/shell-scripts/src/bash | Telescope find_files",
			},
			{
				icon = " ",
				icon_hl = "Title",
				desc = "Zshrc",
				desc_hl = "String",
				key = "z",
				keymap = "SPC f z",
				key_hl = "Number",
				action = ":e ~/.zshrc"
			},
			{
				icon = ' ',
				icon_hl = "Title",
				desc = "Update plugins",
				desc_hl = "String",
				key = "u",
				keymap = "SPC p u",
				key_hl = "Number",
				action = "Lazy update"
			},
			{
				icon = 'Q ',
				icon_hl = "Title",
				desc = "Quit",
				desc_hl = "String",
				key = "q",
				keymap = "SPC q  ",
				key_hl = "Number",
				action = ":quit"
			}
		},
		footer = {quote},
	},
}
return M
