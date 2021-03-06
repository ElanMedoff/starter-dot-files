-- bootstrap packer
local install_path = vim.fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
  PACKER_BOOTSTRAP = vim.fn.system({
    "git",
    "clone",
    "--depth",
    "1",
    "https://github.comewbthomason/packer.nvim",
    install_path,
  })
  print("Installing packer close and reopen Neovim...")
  vim.cmd([[packadd packer.nvim]])
end

-- reloads neovim whenever you save the file
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost /Users/elanmedoff/.config/nvim/lua/elan/plugins/packer.lua source <afile> | PackerSync
  augroup end
]])

-- use a protected call so we don't error out on first use
local packer = require("packer")

return packer.startup({
  function(use)
    use("wbthomason/packer.nvim")
    use("nvim-lua/popup.nvim") -- an implementation of the Popup API from vim in Neovim
    use("nvim-lua/plenary.nvim") -- lua functions used in lots of plugins

    -- themes
    use("mhartington/oceanic-next")
    use("morhetz/gruvbox")
    use("ElanMedoff/vscode.nvim")
    use("ElanMedoff/tokyonight.nvim")

    -- fzf
    use({ "junegunn/fzf", run = "./install --bin" })
    use({ "ibhagwan/fzf-lua", requires = { "kyazdani42/nvim-web-devicons" } })

    -- git
    use("lewis6991/gitsigns.nvim")
    use("tpope/vim-fugitive")
    use({ "sindrets/diffview.nvim", requires = "nvim-lua/plenary.nvim" })

    use("akinsho/toggleterm.nvim")
    use("tpope/vim-surround")
    use("ggandor/lightspeed.nvim")
    use("nvim-lualine/lualine.nvim")
    use("easymotion/vim-easymotion")
    use("psliwka/vim-smoothie")
    use("windwp/nvim-autopairs")
    use({ "kevinhwang91/nvim-bqf", ft = "qf" })
    use({
      "romgrk/barbar.nvim",
      requires = { "kyazdani42/nvim-web-devicons" },
    })
    use("mg979/vim-visual-multi")

    -- tree
    use("kyazdani42/nvim-web-devicons")
    use("kyazdani42/nvim-tree.lua")

    -- cmp
    use("hrsh7th/nvim-cmp")
    use("hrsh7th/cmp-buffer")
    use("hrsh7th/cmp-path")
    use("hrsh7th/cmp-cmdline")
    use("saadparwaiz1/cmp_luasnip")
    use("hrsh7th/cmp-nvim-lsp")
    use("hrsh7th/cmp-nvim-lua")
    use("L3MON4D3/LuaSnip")

    -- lsp
    use("neovim/nvim-lspconfig")
    use("williamboman/nvim-lsp-installer")
    use("jose-elias-alvarez/null-ls.nvim")
    use("MunifTanjim/prettier.nvim")

    -- treesitter
    use({
      "nvim-treesitter/nvim-treesitter",
      run = ":TSUpdate",
    })
    use("p00f/nvim-ts-rainbow")
    use("windwp/nvim-ts-autotag")
    use({ "prettier/vim-prettier", run = "yarn install --frozen-lockfile --production" })

    -- commenting
    use("numToStr/Comment.nvim")
    use("JoosepAlviste/nvim-ts-context-commentstring")

    if PACKER_BOOTSTRAP then
      require("packer").sync()
    end
  end,
  config = {
    display = {
      open_fn = require("packer.util").float,
    },
  },
})
