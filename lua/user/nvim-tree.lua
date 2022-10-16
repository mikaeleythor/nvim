vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

require("nvim-tree").setup({
	sort_by = "case_sensitive",
	view = {
		adaptive_size = false,
		mappings = {
			list = {
				{ key = "u", action = "dir_up" },
			},
		},
	},
	update_focused_file =  {
		enable = true,
    update_root = true,
	},
  prefer_startup_root = true
	--renderer = {
		--group_empty = true,
	--},
	--filters = {
		--dotfiles = true,
	--}
})
