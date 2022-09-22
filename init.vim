noremap <space> <nop>
let mapleader = " "

"""""""""""""""""""""
"""""" OPTIONS """"""
"""""""""""""""""""""
colorscheme slate

set clipboard=unnamedplus "use os clipboard
set number "line numbers
set relativenumber "hard to explain, test it out!
set noerrorbells "disable error beep
set mouse=a "allow mouse to click, scroll
set confirm "prompt to save before quitting
set linebreak "won't break on word when wrapping
set splitright "when splitting vertically, open new split to the right
set fileencoding=utf-8
set ignorecase

"disable vim backups
set noswapfile
set nobackup
set nowritebackup

"tabs
set expandtab "use spaces in tabs
set tabstop=2 "number of columns in a tab
set softtabstop=2 "number of spaces to delete when deleting a tab
set shiftwidth=2 "number of spaces to insert/delete when in insert mode

"folding
set foldmethod=indent "not very intelligent, but most reliable
set foldcolumn=0 "disable fold symbols in left column
set foldlevelstart=99 "open folds by default

""""""""""""""""""""""
""""""" REMAPS """""""
""""""""""""""""""""""

nnoremap <leader>u za| "toggle fold
nnoremap <leader>/t :noh<cr>| "turn off highlighting
nnoremap <leader>o o<esc>
nnoremap <leader>O O<esc>
nnoremap <leader>rr viwp"_dP| "https://youtu.be/qZO9A5F6BZs?t=373
nnoremap <leader>vs :vsplit<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>| "source vimconfig
nnoremap <leader>af <C-6>| "alternate file
nnoremap <leader>r; @:| "repeat last command
nnoremap <leader>' "| "for setting register
nnoremap <leader>p :pu<cr>| "paste on line below
nnoremap <leader>P :pu!<cr>| "paste on line above

"duplicate lines
nnoremap <leader>dl yyp
vnoremap <leader>dl y`>p| "move to end of selection, then yank

nnoremap <leader>s :w<cr>
nnoremap <leader>w :q<cr>
nnoremap <leader>q :qa<cr>

"copy path of file
nnoremap <leader>yy :let @+ = expand("%")<cr>
vnoremap <leader>yy :let @+ = expand("%")<cr>

"keeps lines highlighted while indenting
vnoremap < <gv
vnoremap > >gv

"focusing
nnoremap <leader>f <C-w>w
nnoremap <leader>h <C-w>h
nnoremap <leader>l <C-w>l
nnoremap <leader>j <C-w>j
nnoremap <leader>k <C-w>k

"quickfix list
nnoremap gn :cnext<cr>
nnoremap gp :cprevious<cr>
nnoremap ge :copen<cr>
nnoremap gq :cclose<cr>

"move lines up and down with alt-j, alt-k
nnoremap ∆ :m .+1<cr>==
nnoremap ˚ :m .-2<cr>==
inoremap ∆ <esc>:m .+1<cr>==gi"
inoremap ˚ <esc>:m .-2<cr>==gi"
vnoremap ∆ :m '>+1<cr>gv=gv"
vnoremap ˚ :m '<-2<cr>gv=gv"

noremap <leader>/c /\C<left><left>| "search case sensitive
noremap <leader>/w /\<\><left><left>| "search by whole word
noremap <leader>cw /\<\>\C<left><left><left><left>| "search by both

"search results are always in the middle of the screen
nnoremap n nzz
nnoremap N Nzz

"prevent x, c from overwriting the clipboard
nnoremap x "_x
nnoremap X "_X
nnoremap c "_c
nnoremap C "_C

"https://www.reddit.com/r/vim/comments/82sqoc/comment/dvcm3j9
nnoremap <expr> j v:count ? 'j' : 'gj'
nnoremap <expr> k v:count ? 'k' : 'gk'

"netrw
nnoremap <leader>e :Vexplore<cr>| "open netrw
let g:netrw_winsize = 30
let g:netrw_banner = 0
