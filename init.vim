lua require('init')

 " theme
"let g:vscode_italic_comment = 1
"set background=dark

nnoremap <leader>sv :source $MYVIMRC<cr>

" nerd commenter
filetype plugin on

" close tag
let g:closetag_filenames = '*.html,*.jsx,*.tsx'
let g:closetag_regions =  {
  \ 'typescript.tsx': 'jsxRegion,tsxRegion',
  \ 'javascript.jsx': 'jsxRegion',
  \ }

" tab for autocomplete and snippet complete
inoremap <silent><expr> <TAB>
      \ pumvisible() ? coc#_select_confirm() :
      \ coc#expandableOrJumpable() ? "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" :
      \ <SID>check_back_space() ? "\<TAB>" :
