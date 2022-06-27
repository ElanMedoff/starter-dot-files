package.path = package.path .. ";./?.lua"
local helpers = require("helpers")

require "paq" {
    "savq/paq-nvim",
    -- themes
    "mhartington/oceanic-next",
    "morhetz/gruvbox",
    "Mofiqul/vscode.nvim",
    {"ibhagwan/fzf-lua", branch = "main"},
    "akinsho/toggleterm.nvim",
    "tpope/vim-surround",
    "tpope/vim-fugitive",
    "alvan/vim-closetag",
    "ggandor/lightspeed.nvim",
    "nvim-lualine/lualine.nvim",
    "easymotion/vim-easymotion",
    "Yggdroot/indentLine",
    "neoclide/coc.nvim",
    "psliwka/vim-smoothie",
    "HerringtonDarkholme/yats.vim",
    "preservim/nerdcommenter",
    "kyazdani42/nvim-web-devicons",
    "kyazdani42/nvim-tree.lua",
    "romgrk/barbar.nvim"
}

helpers.let.mapleader = " "
require("remaps")
require("opts")
require("plugins.barbar")
require("plugins.coc")
require("plugins.fzf")
require("plugins.lightspeed")
require("plugins.lualine")
require("plugins.toggleterm")
require("plugins.tree")
