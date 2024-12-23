if !has_key(plugs, 'nerdtree')
  finish
endif

let NERDTreeShowHidden = 1

" Point current file in NERDTree
function! s:NERDTreeFindOrClose()
  if &filetype ==# 'nerdtree'
    :NERDTreeClose
  else
    :NERDTreeFind
  endif
endfunction
nnoremap <leader>f :call <SID>NERDTreeFindOrClose()<CR>

" toggle nerdtree
nnoremap <leader>e :NERDTreeToggle<CR>
