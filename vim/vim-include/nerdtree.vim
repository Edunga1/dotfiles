if !has_key(plugs, 'nerdtree')
  finish
endif

let NERDTreeShowHidden = 1

" find this file in nerdtree
nnoremap <leader>f :NERDTreeFind<CR>

" toggle nerdtree
nnoremap <leader>e :NERDTreeToggle<CR>
