package.path = package.path .. ";../?.lua"
local h = require("elan.helpers")

require("fzf-lua").setup({
	winopts = {
		height = 0.85,
		width = 0.90,
		preview = {
			scrollbar = false,
			layout = "vertical",
		},
	},
	grep = {
		glob_flag = "--glob",
	},
})

h.nmap("<C-p>", [[<cmd>lua require('fzf-lua').files()<CR>]])
h.nmap("<leader>zr", [[<cmd>lua require('fzf-lua').grep()<CR>]]) -- choose before you grep
h.nmap("<leader>zg", [[<cmd>lua require('fzf-lua').grep_project()<CR>]]) -- choose as you grep
h.nmap("<leader>zf", [[<cmd>lua require('fzf-lua').blines()<CR>]]) -- within file
h.nmap("<leader>zl", [[<cmd>lua require('fzf-lua').grep_last()<CR>]])
h.nmap("<leader>zw", [[<cmd>lua require('fzf-lua').grep_cword()<CR>]]) -- word under cursor
