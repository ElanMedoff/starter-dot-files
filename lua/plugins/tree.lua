package.path = package.path .. ";../?.lua"
local helpers = require("helpers")

require "nvim-tree".setup {
    open_on_tab = true,
    view = {
        mappings = {
            custom_only = false,
            list = {
                {key = "Y", action = "copy_path"},
                {key = "<CR>", action = "tabnew"},
                {key = "s", action = ""}
            }
        }
    },
    renderer = {
        highlight_opened_files = "all"
    }
}
helpers.nmap("<leader>f", "<C-w>w")
helpers.nmap("<leader>rb", ":NvimTreeToggle<CR>")
helpers.nmap("<leader>re", ":NvimTreeFindFile<CR>")
