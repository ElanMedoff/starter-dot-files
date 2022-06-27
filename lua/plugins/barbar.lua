package.path = package.path .. ";../?.lua"
local helpers = require("helpers")

helpers.nmap("<Leader>tw", ":BufferClose<cr>")
helpers.nmap("<leader>tp", ":BufferPrevious<cr>")
helpers.nmap("<leader>tn", ":BufferNext<cr>")
helpers.nmap("<leader>to", ":BufferCloseAllButCurrent<cr>")
