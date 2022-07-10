local h = require("elan.helpers")

-- set leader before importing remaps with <leader>
h.map("", "<space>", "<nop>", { silent = true })
h.let.mapleader = " "

require("elan.remaps")
require("elan.options")
require("elan.lsp")
require("elan.plugins")
require("elan.plugins.autopairs")
require("elan.plugins.barbar")
require("elan.plugins.cmp")
require("elan.plugins.comment")
require("elan.plugins.fzf")
require("elan.plugins.gitsigns")
require("elan.plugins.lightspeed")
require("elan.plugins.lualine")
require("elan.plugins.nullls")
require("elan.plugins.toggleterm")
require("elan.plugins.tree")
require("elan.plugins.treesitter")
