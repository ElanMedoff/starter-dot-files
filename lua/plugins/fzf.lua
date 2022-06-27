package.path = package.path .. ";../?.lua"
local helpers = require("helpers")

require "fzf-lua".setup {
    winopts = {
        height = 0.85,
        width = 0.90,
        preview = {
            scrollbar = false
        }
    }
}

helpers.nmap("<C-p>", [[<cmd>lua require('fzf-lua').files()<CR>]])
helpers.nmap("<leader>zg", [[<cmd>lua require('fzf-lua').grep()<CR>]])
helpers.nmap("<leader>zf", [[<cmd>lua require('fzf-lua').blines()<CR>]])
helpers.nmap("<leader>zv", [[<cmd>lua require('fzf-lua').tags_grep_visual()<CR>]])
