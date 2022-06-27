package.path = package.path .. ";../?.lua"
local helpers = require("helpers")

helpers.set.hidden = true
helpers.set.backup = false
helpers.set.writebackup = false
helpers.set.signcolumn = "number"

--helpers.map('n', '<silent>gd',  '<Plug>(coc-definition)', {noremap = false})
--helpers.map('n', '<silent>gy',  '<Plug>(coc-type-definition)', {noremap = false})
--helpers.map('n', '<silent>gu',  '<Plug>(coc-references)', {noremap = false})
--helpers.map('n', '<silent>ga',  '<Plug>(coc-codeaction)', {noremap = false})
--helpers.map('n', '<silent>gn',  ':CocNext<cr>	', {noremap = false})
--helpers.map('n', '<silent>gp',  ':CocPrev<cr>', {noremap = false})
--helpers.map('n', '<silent> gh',  ':call ShowDocumentation()<cr>', {noremap = false})

helpers.cmd([[ set shortmess+=c ]])
helpers.cmd([[ let g:coc_snippet_next = '<tab>' ]])
helpers.cmd([[
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction
]])

helpers.cmd([[
function! CheckBackspace() abort
let col = col('.') - 1
return !col || getline('.')[col - 1]  =~# '\s'
endfunction
]])

helpers.cmd([[
" GoTo code navigation.
nmap <silent>gd <Plug>(coc-definition)
nmap <silent>gy <Plug>(coc-type-definition)
nmap <silent>gu <Plug>(coc-references)
nmap <silent>ga <Plug>(coc-codeaction)
nmap <silent>gn :CocNext<cr>
nmap <silent>gp :CocPrev<cr>
nmap <silent> gh :call ShowDocumentation()<cr>
]])

helpers.cmd([[
function! ShowDocumentation()
  if CocAction('hasProvider', 'hover')
    call CocActionAsync('doHover')
  else
    call feedkeys('K', 'in')
  endif
endfunction
]])

helpers.cmd([[
let g:coc_global_extensions = [
\ 'coc-tsserver',
\ 'coc-prettier',
\ 'coc-json',
\ 'coc-eslint',
\ 'coc-snippets',
\ ]
]])
