package.path = package.path .. ";../?.lua"
local h = require("elan.helpers")

-- set leader before importing remaps with <leader>
h.map("", "<space>", "<nop>", { silent = true })
h.let.mapleader = " "

h.nmap("<leader>o", "o<esc>")
h.nmap("<leader>O", "O<esc>")
h.nmap("<leader>rr", "viwp")
h.nmap("<leader>r;", "@:")

h.nmap("gn", ":cnext<cr>")
h.nmap("gp", ":cprevious<cr>")
h.nmap("go", ":copen<cr>")
h.nmap("gq", ":cclose<cr>")

h.nmap("∆", ":m .+1<cr>==")
h.nmap("˚", ":m .-2<cr>==")
h.imap("∆", "<esc>:m .+1<cr>==gi")
h.imap("˚", "<esc>:m .-2<cr>==gi")
h.vmap("∆", ":m '>+1<cr>gv=gv")
h.vmap("˚", ":m '<-2<cr>gv=gv")

h.nmap([[<leader>']], [["]])
h.nmap("<leader>gn", ":q<cr>:q<cr>")
h.nmap("<leader>gb", ":Git blame")
h.vmap("<", "<gv")
h.vmap(">", ">gv")
