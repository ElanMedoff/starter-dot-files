call plug#begin('~/.config/nvim/plugged')
if exists('g:vscode')
  Plug 'ggandor/lightspeed.nvim'
endif
call plug#end()


if exists('g:vscode')
  let mapleader=" "

  vnoremap < <gv
  vnoremap > >gv
  nnoremap <leader>o o<esc>
  nnoremap <leader>O O<esc>
  nnoremap <leader>rr viwp

  hi LightspeedCursor gui=reverse
  else
    lua require('init')
endif
