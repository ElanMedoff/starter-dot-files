package.path = package.path .. ";../?.lua"
local helpers = require("helpers")

require("toggleterm").setup {}
helpers.map("", "<C-t>", ":ToggleTerm size=50 direction=vertical<CR>", {})
helpers.cmd([[
autocmd TermEnter term://*toggleterm#*
      \ tnoremap <silent><C-t> <Cmd>exe v:count1 . "ToggleTerm"<CR>
]])
