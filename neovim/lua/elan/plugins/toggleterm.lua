package.path = package.path .. ";../?.lua"
local h = require("elan.helpers")

require("toggleterm").setup({})
h.map("", "<C-t>", ":ToggleTerm size=50 direction=vertical<CR>", {})
h.cmd([[
  autocmd TermEnter term://*toggleterm#* tnoremap <silent><C-t> <Cmd>exe v:count1 . "ToggleTerm"<CR>
]])
