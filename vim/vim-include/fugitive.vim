if !has_key(plugs, 'vim-fugitive')
  finish
endif

" vimdiff
nnoremap <leader>d :Gdiffsplit<CR>
