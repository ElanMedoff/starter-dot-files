package.path = package.path .. ";../?.lua"

-- order matters
require("elan.remaps")
require("elan.options")
require("elan.lsp")
require("elan.plugins")