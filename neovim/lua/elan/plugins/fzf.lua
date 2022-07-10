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
})

h.nmap("<C-p>", [[<cmd>lua require('fzf-lua').files()<CR>]])
h.nmap("<leader>zg", [[<cmd>lua require('fzf-lua').grep()<CR>]])
h.nmap("<leader>zf", [[<cmd>lua require('fzf-lua').blines()<CR>]])
