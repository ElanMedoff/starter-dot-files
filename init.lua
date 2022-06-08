require('lightspeed').setup {}
require("toggleterm").setup{}
require'nvim-tree'.setup {
  open_on_tab = true,
  view = {
    mappings = {
      custom_only = false,
      list = {
        { key = "Y", action = "copy_path" },
        { key = "<CR>", action = "tabnew" },
        { key = "s", action = "" }
      },
    },
  },
}

