call plug#begin('~/.config/nvim/plugged')
Plug 'ElanMedoff/vscode.nvim'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'ibhagwan/fzf-lua', {'branch': 'main'}
Plug 'akinsho/toggleterm.nvim'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-repeat'
Plug 'alvan/vim-closetag'
Plug 'ggandor/lightspeed.nvim'
Plug 'nvim-lualine/lualine.nvim'
Plug 'easymotion/vim-easymotion'
Plug 'Yggdroot/indentLine'
Plug 'neoclide/coc.nvim'
Plug 'psliwka/vim-smoothie'
Plug 'preservim/nerdcommenter'
Plug 'kyazdani42/nvim-web-devicons'
Plug 'kyazdani42/nvim-tree.lua'
Plug 'romgrk/barbar.nvim'
Plug 'mg979/vim-visual-multi'
Plug 'kevinhwang91/nvim-bqf'
call plug#end()

lua require('init')

" set leader before using in remaps below
let mapleader=" "
set clipboard=unnamedplus "copies to system clipboard

" move lines with alt j, alt k in all modes
nnoremap ∆ :m .+1<cr>==
nnoremap ˚ :m .-2<cr>==
inoremap ∆ <esc>:m .+1<cr>==gi
inoremap ˚ <esc>:m .-2<cr>==gi
vnoremap ∆ :m '>+1<cr>gv=gv
vnoremap ˚ :m '<-2<cr>gv=gv

nnoremap <leader>sv :source $MYVIMRC<cr>
nnoremap <leader>rr viwp
nnoremap <leader>o o<Esc>
nnoremap <leader>O O<Esc>
" repeat last command
nnoremap <leader>r; @:
" open in vertical split
nnoremap <leader>vs :vsplit<cr>

nnoremap <leader>s :w<cr>
nnoremap <leader>w :q<cr>
nnoremap <leader>q :qa<cr>

" copy path of file
nnoremap <leader>yy :let @+ = expand("%")<cr>
vnoremap <leader>yy :let @+ = expand("%")<cr>

" keeps lines highlighted while indenting
vnoremap > >gv
vnoremap < <gv

" ui
set number "number lines
set cursorline "highlight current line
set noerrorbells
set mouse=a "allow mouse to click, scroll
set confirm "prompt to save before quitting
set noshowmode "show interferes with lualine
set nolinebreak "won't break on word when wrapping
set splitright "when splitting vertically, open new buffer to the right
set linebreak "avoid wrapping line in middle of word

" disable backups
set noswapfile
set nobackup
set nowritebackup

" theme
colorscheme vscode

" folding
set foldmethod=indent
set foldcolumn=0
set foldlevelstart=99
nnoremap <leader>u za

" search
set ignorecase
noremap <leader>/c /\C<left><left>
noremap <leader>/w /\<\><left><left>
noremap <leader>/t :noh<cr>
noremap <leader>cw /\<\>\C<left><left><left><left>

" tab stuff
set expandtab "use spaces in tabs
set tabstop=2 "number of columns in a tab
set softtabstop=2 "number of spaces to delete when deleting a tab
set shiftwidth=2 "number of spaces to insert/delete when in insert mode

" toggleterm
autocmd TermEnter term://*toggleterm#*
      \ tnoremap <silent><C-g> <Cmd>exe v:count1 . "ToggleTerm"<CR>
map <C-g> :ToggleTerm size=50 direction=vertical<CR>

" barbar
nnoremap <Leader>tw :BufferClose<cr>
nnoremap <leader>tp :BufferPrevious<CR>
nnoremap <leader>tn :BufferNext<CR>
nnoremap <leader>to :BufferCloseAllButCurrent<CR>

" fzf
noremap <C-p> <cmd>lua require('fzf-lua').files()<CR>
nnoremap <leader>zr <cmd>lua require('fzf-lua').grep()<CR>
nnoremap <leader>zg <cmd>lua require('fzf-lua').grep_project()<CR>
nnoremap <leader>zf <cmd>lua require('fzf-lua').blines()<CR>
noremap <leader>zl <cmd>lua require('fzf-lua').grep_last()<CR>
noremap <leader>zw <cmd>lua require('fzf-lua').grep_cword()<CR>

" nvim tree
nnoremap <leader>f <c-w>w
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
set signcolumn=number

" helper functions
function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

function! ShowDocumentation()
  if CocAction('hasProvider', 'hover')
    call CocActionAsync('doHover')
  else
    call feedkeys('K', 'in')
  endif
endfunction

inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#_select_confirm() :
      \ coc#expandableOrJumpable() ? "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" :
      \ CheckBackspace() ? "\<TAB>" :
      \ coc#refresh()

inoremap <silent><expr> <cr> coc#pum#visible() ? coc#pum#confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" code navigation
nmap <silent>gd <Plug>(coc-definition)
nmap <silent>gy <Plug>(coc-type-definition)
nmap <silent>gu <Plug>(coc-references)
nmap <silent>ga <Plug>(coc-codeaction)
nmap <silent>gh :call ShowDocumentation()<cr>
" go back in navigation
nmap <silent>go <C-o>
" go forward in navigation
nmap <silent>gi <C-i>

" quickfix list
nmap <silent>gn :cnext<cr>
nmap <silent>gp :cprevious<cr>
nmap <silent>ge :copen<cr>
nmap <silent>gq :cclose<cr>

let g:coc_global_extensions = [
\ 'coc-tsserver',
\ 'coc-prettier',
\ 'coc-json',
\ 'coc-eslint',
\ 'coc-snippets',
\ 'coc-pairs',
\ ]
