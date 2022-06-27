call plug#begin('~/.config/nvim/plugged')
" themes
Plug 'mhartington/oceanic-next'
Plug 'morhetz/gruvbox'
Plug 'Mofiqul/vscode.nvim'
"fzf
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'ibhagwan/fzf-lua', {'branch': 'main'}

Plug 'akinsho/toggleterm.nvim'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-fugitive'
Plug 'alvan/vim-closetag'
Plug 'ggandor/lightspeed.nvim'
Plug 'nvim-lualine/lualine.nvim'
Plug 'easymotion/vim-easymotion'
Plug 'Yggdroot/indentLine'
Plug 'neoclide/coc.nvim'
Plug 'psliwka/vim-smoothie'
Plug 'HerringtonDarkholme/yats.vim'
Plug 'preservim/nerdcommenter'
Plug 'kyazdani42/nvim-web-devicons'
Plug 'kyazdani42/nvim-tree.lua'
Plug 'romgrk/barbar.nvim'
call plug#end()

lua require('init')

" move lines with alt j, alt k
nnoremap ∆ :m .+1<cr>==
nnoremap ˚ :m .-2<cr>==
inoremap ∆ <esc>:m .+1<cr>==gi
inoremap ˚ <esc>:m .-2<cr>==gi
vnoremap ∆ :m '>+1<cr>gv=gv
vnoremap ˚ :m '<-2<cr>gv=gv
nnoremap <leader>gn :w<cr>:w<cr>
nnoremap <leader>' "
nnoremap <leader>sv :source $MYVIMRC<cr>
nnoremap <leader>gb :Git blame<cr>
nnoremap <leader>rr viwp
nnoremap <leader>r; @:
nnoremap <leader>o o<Esc>
nnoremap <leader>O O<Esc>
nnoremap <leader>qn :cnext<cr>
nnoremap <leader>qp :cprevious<cr>

let mapleader=" "
set clipboard=unnamedplus "copies to system clipboard

" ui
set number "number lines
set cursorline "highlight current line
set noerrorbells
set mouse=a
set confirm
set showmode
set noswapfile

" theme
colorscheme oceanicnext
"let g:vscode_italic_comment = 1
"set background=dark

" folding
set foldmethod=syntax
set foldcolumn=1
let javaScript_fold=1
set foldlevelstart=99
nnoremap <leader>u za

" search
set ignorecase
noremap <leader>/c /\C<left><left>
noremap <leader>/w /\<\><left><left>
noremap <leader>/t :noh<cr>
noremap <leader>cw /\<\>\C<left><left><left><left>

" text rendering
set linebreak " avoid wrapping line in middle of word

" tab stuff
set expandtab " use spaces in tabs
set tabstop=4 " number of columns in a tab
set softtabstop=4 " number of spaces to delete when deleting a tab
set shiftwidth=4 " number of spaces to insert/delete when in insert mode

" toggleterm
autocmd TermEnter term://*toggleterm#*
      \ tnoremap <silent><C-t> <Cmd>exe v:count1 . "ToggleTerm"<CR>
map <C-t> :ToggleTerm size=50 direction=vertical<CR>

" barbar
nnoremap <Leader>tw :BufferClose<cr>
nnoremap <leader>tp :BufferPrevious<CR>
nnoremap <leader>tn :BufferNext<CR>
nnoremap <leader>to :BufferCloseAllButCurrent<CR>

" fzf
noremap <C-p> <cmd>lua require('fzf-lua').files()<CR>
nnoremap <leader>zg <cmd>lua require('fzf-lua').grep()<CR>
nnoremap <leader>zf <cmd>lua require('fzf-lua').blines()<CR>
noremap <leader>zv <cmd>lua require('fzf-lua').tags_grep_visual()<CR>

let g:fzf_preview_window = ['up:50%']

" nerd tree
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

nnoremap <leader>rb :NvimTreeToggle<CR>
nnoremap <leader>re :NvimTreeFindFile<CR>
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
nmap <silent>gd <Plug>(coc-definition)
nmap <silent>gy <Plug>(coc-type-definition)
nmap <silent>gu <Plug>(coc-references)
nmap <silent>ga <Plug>(coc-codeaction)
nmap <silent>gn :CocNext<cr>
nmap <silent>gp :CocPrev<cr>
nmap <silent>gh :call ShowDocumentation()<cr>
nmap <silent>go <C-o>

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