call plug#begin('~/.config/nvim/plugged')

Plug 'junegunn/fzf.vim'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'tpope/vim-surround'
Plug 'tpope/vim-fugitive'
Plug 'alvan/vim-closetag'
Plug 'ggandor/lightspeed.nvim'
Plug 'itchyny/lightline.vim'
Plug 'easymotion/vim-easymotion'
Plug 'Yggdroot/indentLine'
Plug 'neoclide/coc.nvim'
Plug 'mg979/vim-visual-multi'
Plug 'psliwka/vim-smoothie'
Plug 'HerringtonDarkholme/yats.vim'
Plug 'preservim/nerdcommenter'
Plug 'tomasiser/vim-code-dark'

" telescope
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'kyazdani42/nvim-web-devicons'
Plug 'kyazdani42/nvim-tree.lua'

call plug#end()

lua require('init')

" remaps

vnoremap v ""

" move lines with alt j, alt k
nnoremap ∆ :m .+1<cr>==
nnoremap ˚ :m .-2<cr>==
inoremap ∆ <esc>:m .+1<cr>==gi
inoremap ˚ <esc>:m .-2<cr>==gi
vnoremap ∆ :m '>+1<cr>gv=gv
vnoremap ˚ :m '<-2<cr>gv=gv

let mapleader=" "
imap <C-j> (
imap <C-k> [
imap <C-l> {
imap <C-h> =

map <leader>gd :tabdo :Gvdiffsplit<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>

map <leader>tn :tabnext<cr>
map <leader>tc :tabclose<cr>
map <leader>to :tabonly<cr>

" copies to clipboard
set clipboard=unnamedplus

" ui
set number
set cursorline
set noerrorbells
set title
set mouse=a
set confirm
set showmode
colorscheme codedark

" search
set ignorecase
set incsearch
set hlsearch
map <leader>c/ /\C<left><left>
map <leader>w/ /\<\><left><left>
map <leader>cw /\<\>\C<left><left><left><left>
map <esc> :noh<cr>

" fzf
noremap <leader>rg :Rg

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

nnoremap <leader>f <c-w>w

let g:nvim_tree_git_hl = 1
let g:nvim_tree_highlight_opened_files = 1
let g:nvim_tree_add_trailing = 1
let g:nvim_tree_respect_buf_cwd = 1
let g:nvim_tree_create_in_closed_folder = 1

let g:nvim_tree_show_icons = {
    \ 'git': 1,
    \ 'folders': 1,
    \ 'files': 1,
    \ 'folder_arrows': 1,
    \ }

" will show icon by default if no icon is provided
let g:nvim_tree_icons = {
    \ 'default': "",
    \ 'symlink': "",
    \ 'git': {
    \   'unstaged': "✗",
    \   'staged': "✓",
    \   'unmerged': "",
    \   'renamed': "➜",
    \   'untracked': "★",
    \   'deleted': "",
    \   'ignored': "◌"
    \   },
    \ 'folder': {
    \   'arrow_open': "",
    \   'arrow_closed': "",
    \   'default': "",
    \   'open': "",
    \   'empty': "",
    \   'empty_open': "",
    \   'symlink': "",
    \   'symlink_open': "",
    \   }
    \ }

nnoremap <leader>b :NvimTreeToggle<CR>
set termguicolors 

" nerd commenter
filetype plugin on

" close tag
let g:closetag_filenames = '*.html,*.jsx,*.tsx'
let g:closetag_regions =  {
  \ 'typescript.tsx': 'jsxRegion,tsxRegion',
  \ 'javascript.jsx': 'jsxRegion',
  \ }

" coc
" basic setup
set hidden
set nobackup
set nowritebackup
set cmdheight=2
set updatetime=300
set shortmess+=c
if has("nvim-0.5.0") || has("patch-8.1.1564")
  set signcolumn=number
else
  set signcolumn=yes
endif

" Use tab for trigger completion with characters ahead and navigate.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ CheckBackspace() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

nnoremap <silent> gh :call ShowDocumentation()<cr>

function! ShowDocumentation()
  if CocAction('hasProvider', 'hover')
    call CocActionAsync('doHover')
  else
    call feedkeys('K', 'in')
  endif
endfunction

let g:coc_global_extensions = [
\ 'coc-tsserver',
\ 'coc-prettier',
\ 'coc-json',
\ 'coc-eslint',
\ ]

command! -nargs=0 Prettier :CocCommand prettier.forceFormatDocument
map <leader>pp :Prettier<cr>

" telescope
nnoremap <C-p> <cmd>Telescope find_files<cr>
