if !has_key(plugs, 'tagbar')
  finish
endif

" toggle tagbar
nmap <leader>t :TagbarToggle<cr>
