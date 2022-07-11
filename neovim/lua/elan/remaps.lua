package.path = package.path .. ";../?.lua"
local h = require("elan.helpers")

-- set leader before importing remaps with <leader>
h.map("", "<space>", "<nop>", { silent = true })
h.let.mapleader = " "

h.nmap("<leader>o", "o<esc>")
h.nmap("<leader>O", "O<esc>")
h.nmap("<leader>rr", "viwp")
h.nmap("<leader>r;", "@:") -- repeat last command
h.nmap([[<leader>']], [["]])
h.nmap("<leader>gb", ":Git blame")
h.nmap("<leader>gd", ":DiffviewOpen<cr>")
h.nmap("<leader>gq", ":DiffviewClose<cr>")

-- keeps lines highlighted while indenting
h.vmap("<", "<gv")
h.vmap(">", ">gv")

-- focusing
h.nmap("<leader>f", "<C-w>w") -- toggle
h.nmap("<leader>h", "<C-w>h") -- left
h.nmap("<leader>l", "<C-w>l") -- right

-- quickfix list
h.nmap("gn", ":cnext<cr>")
h.nmap("gp", ":cprevious<cr>")
h.nmap("go", ":copen<cr>")
h.nmap("gq", ":cclose<cr>")

-- move lines up and down with alt-j, alt-k
h.nmap("∆", ":m .+1<cr>==")
h.nmap("˚", ":m .-2<cr>==")
h.imap("∆", "<esc>:m .+1<cr>==gi")
h.imap("˚", "<esc>:m .-2<cr>==gi")
h.vmap("∆", ":m '>+1<cr>gv=gv")
h.vmap("˚", ":m '<-2<cr>gv=gv")
