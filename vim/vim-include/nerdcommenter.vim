if !has_key(plugs, 'nerdcommenter')
  finish
endif

" Disable default mappings
let g:NERDCreateDefaultMappings = 0

" Align line-wise comment delimiters flush left instead of following code indentation
let g:NERDDefaultAlign = 'left'

" Short for <leader>c<space>
map <Leader><Leader> :call nerdcommenter#Comment(0,'toggle')<CR>
