call plug#begin('~/.config/nvim/plugged')

Plug 'easymotion/vim-easymotion'
Plug 'justinmk/vim-sneak'
Plug 'tomasiser/vim-code-dark'
Plug 'mg979/vim-visual-multi'
Plug 'psliwka/vim-smoothie'
Plug 'HerringtonDarkholme/yats.vim'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'tpope/vim-surround'
Plug 'preservim/nerdcommenter'

" nerd tree
Plug 'preservim/nerdtree'
Plug 'ryanoasis/vim-devicons'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'

call plug#end()

" remaps
let mapleader = " "
nnoremap E ge
" v in visual mode doesn't exit
vnoremap v ""
inoremap ( ()<Left>
inoremap [ []<Left>
inoremap { {}<Left>

" ui
set number
set cursorline
colorscheme codedark
set noerrorbells
set title
set mouse=a
set confirm
set showmode
set clipboard=unnamedplus
autocmd VimEnter * NERDTree | wincmd p

" search
set ignorecase
set incsearch " partial matches
set smartcase
set hlsearch " highlight matches

" text rendering
set display+=lastline
set linebreak " avoid wrapping line in middle of word
syntax enable
set wrap

" tab stuff
set tabstop=4
set softtabstop=0
set expandtab
set shiftwidth=2
set smarttab

" nerd tree
let g:NERDTreeIgnore = ['^node_modules$']
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1
nnoremap <Leader>t :NERDTreeToggle<Enter>
nnoremap <Leader>f <c-w>w

" sync open file with NERDTree
function! IsNERDTreeOpen()
  return exists("t:NERDTreeBufName") && (bufwinnr(t:NERDTreeBufName) != -1)
endfunction

function! SyncTree()
  if &modifiable && IsNERDTreeOpen() && strlen(expand('%')) > 0 && !&diff
    NERDTreeFind
    wincmd p
  endif
endfunction

autocmd BufEnter * call SyncTree()

" ctrlp
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_working_path_mode = 'ra'
set wildignore+=*/tmp/*,*.so,*.swp,*.zip
let g:ctrlp_user_command = 'find %s -type f'
let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files -co --exclude-standard']

" nerd commenter
filetype plugin on
