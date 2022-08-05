## neovim

- a minimal(ish) config written entirely in lua, taking advantage of the built-in lsp support.

  - eventually needed to set up treesitter for proper [t/jsx commenting](https://github.com/JoosepAlviste/nvim-ts-context-commentstring) and [t/jsx pair renaming](https://github.com/windwp/nvim-ts-autotag)
  - if it's a default, I try not to include it in my config

- heavily inspired by [this repo](https://github.com/LunarVim/Neovim-from-scratch)

---

requirements:

- [ neovim ](https://github.com/neovim/neovim/wiki/Installing-Neovim) >= 0.8
  - see the nightly build
- [packer](https://github.com/wbthomason/packer.nvim#quickstart)
- [ripgrep](https://github.com/BurntSushi/ripgrep#installation) for fzf
- [stylua](https://github.com/JohnnyMorganz/StyLua#from-cratesio) for lua formatting
  - easiest to install with [rust](https://www.rust-lang.org/tools/install)
- `:LspInstallInfo` for an interactive ui to download language servers
