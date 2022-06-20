call plug#begin('~/.config/nvim/plugged')

Plug 'morhetz/gruvbox'
Plug 'akinsho/toggleterm.nvim'
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
Plug 'kyazdani42/nvim-web-devicons'
Plug 'kyazdani42/nvim-tree.lua'
Plug 'romgrk/barbar.nvim'

call plug#end()
lua require('init')

let mapleader=" "

" remaps
" move lines with alt j, alt k
nnoremap ∆ :m .+1<cr>==
nnoremap ˚ :m .-2<cr>==
inoremap ∆ <esc>:m .+1<cr>==gi
inoremap ˚ <esc>:m .-2<cr>==gi
vnoremap ∆ :m '>+1<cr>gv=gv
vnoremap ˚ :m '<-2<cr>gv=gv

noremap <Leader>gd :tabdo :Gvdiffsplit<cr>
noremap <Leader>tc :tabclose<cr>
noremap <Leader>' "
noremap <Leader>w :BufferClose<cr>
noremap <leader>sv :source $MYVIMRC<cr>

nnoremap <leader>gb :Git blame<cr>
nnoremap <leader>rr viwp

nnoremap <Leader>o o<Esc>
nnoremap <Leader>O O<Esc>
nnoremap <Leader>] :cnext<cr>	
nnoremap <Leader>[ :cprevious<cr>
nnoremap q i
vnoremap v ""

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
colorscheme gruvbox
set noswapfile

" force syntax rescan
autocmd BufEnter *.{js,jsx,ts,tsx} :syntax sync fromstart
autocmd BufLeave *.{js,jsx,ts,tsx} :syntax sync clear

" folding
set foldmethod=syntax
set foldcolumn=1
let javaScript_fold=1
set foldlevelstart=99
nnoremap <leader>u za

" search
set ignorecase
set incsearch
set hlsearch
noremap <leader>/c /\C<left><left>
noremap <leader>/w /\<\><left><left>
noremap <leader>/t :noh<cr>
noremap <leader>cw /\<\>\C<left><left><left><left>
noremap <esc> :noh<cr>

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

" integrated terminal
autocmd TermEnter term://*toggleterm#*
      \ tnoremap <silent><C-t> <Cmd>exe v:count1 . "ToggleTerm"<CR>
map <C-t> :ToggleTerm size=50 direction=vertical<CR>

" barbar
nnoremap <leader>tp :BufferPrevious<CR>
nnoremap <leader>tn :BufferNext<CR>
nnoremap <leader>to :BufferCloseAllButCurrent<CR>

" fzf
noremap <leader>ag :Ag
nnoremap <C-p> :Files<cr>
nnoremap <leader>zf :BLines<cr>
nnoremap <leader>zh :History:<cr>

"nerd tree
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
nnoremap <leader>ee :NvimTreeFindFile<CR>
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

" tab for autocomplete and snippet complete
inoremap <silent><expr> <TAB>
      \ pumvisible() ? coc#_select_confirm() :
      \ coc#expandableOrJumpable() ? "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction
let g:coc_snippet_next = '<tab>'

function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gu <Plug>(coc-references)
nmap <leader>ac <Plug>(coc-codeaction)

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
\ 'coc-snippets', 
\ ]

