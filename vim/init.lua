require("lightspeed").setup({
	ignore_case = true,
})
require("toggleterm").setup({})
require("nvim-tree").setup({
	open_on_tab = true, -- makes the tree seem separate from the tabs
	renderer = {
		highlight_opened_files = "all",
		highlight_git = true,
	},
	git = {
		ignore = false,
	},
})
