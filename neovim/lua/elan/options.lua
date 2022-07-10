package.path = package.path .. ";../?.lua"
local h = require("elan.helpers")

h.cmd("colorscheme tokyonight")

h.set.clipboard = "unnamedplus"
h.set.number = true
h.set.cursorline = true
h.set.errorbells = false
h.set.mouse = "a"
h.set.confirm = true
h.set.linebreak = true
h.set.termguicolors = true
h.set.fileencoding = "utf-8"
h.set.undofile = true -- redo farther in the past
h.set.signcolumn = "yes"
h.set.wrap = false -- wont break on word when wrapping
h.set.showmode = false
h.set.lazyredraw = true

-- backups
h.set.swapfile = false
h.set.backup = false
h.set.writebackup = false

-- tabs
h.set.expandtab = true -- use spaces in tabs
h.set.tabstop = 4 -- number of columns in a tab
h.set.softtabstop = 4 -- number of spaces to delete when deleting a tab
h.set.shiftwidth = 4 -- number of spaces to insert/delete when in insert mode

-- folding
h.set.foldmethod = "syntax"
h.set.foldcolumn = "0"
h.set.foldlevelstart = 99
h.let.javaScript_fold = 1
h.nmap("<leader>u", "za")

-- search
h.set.ignorecase = true
h.nmap("<leader>/t", ":noh<cr>")
h.cmd([[
  noremap <leader>/c /\C<left><left>
  noremap <leader>/w /\<\><left><left>
  noremap <leader>cw /\<\>\C<left><left><left><left>
]])
