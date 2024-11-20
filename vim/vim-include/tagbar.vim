if !has_key(plugs, 'tagbar')
  finish
endif

" keep orderding
let g:tagbar_sort = 0

" toggle tagbar
nmap <leader>t :TagbarToggle<cr>
