package.path = package.path .. ";./?.lua"
local helpers = require("helpers")

helpers.cmd "colorscheme oceanicnext"

helpers.set.clipboard = "unnamedplus"
helpers.set.number = true
helpers.set.cursorline = true
helpers.set.errorbells = false
helpers.set.mouse = "a"
helpers.set.confirm = true
helpers.set.swapfile = false
helpers.set.linebreak = true
helpers.set.termguicolors = true

-- tabs
helpers.set.expandtab = true -- use spaces in tabs
helpers.set.tabstop = 4 -- number of columns in a tab
helpers.set.softtabstop = 4 -- number of spaces to delete when deleting a tab
helpers.set.shiftwidth = 4 -- number of spaces to insert/delete when in insert mode

-- folding
helpers.set.foldmethod = "syntax"
helpers.set.foldcolumn = "1"
helpers.set.foldlevelstart = 99
helpers.let.javaScript_fold = 1
helpers.nmap("<leader>u", "za")

-- search
helpers.set.ignorecase = true
helpers.nmap("<leader>/t", ":noh<cr>")
--helpers.nmap('<leader>/c', [[/\C<left><left>]])
--helpers.nmap('<leader>/w', [[/\<\><left><left>]])
--helpers.nmap('<leader>cw', [[/\<\>\C<left><left><left><left>]])
helpers.cmd([[
noremap <leader>/c /\C<left><left>
noremap <leader>/w /\<\><left><left>
noremap <leader>cw /\<\>\C<left><left><left><left>
]])
