" vim-airline/vim-airline

" vim-airline-themes
let g:airline_theme = 'jellybeans'

" hide filetype (section x)
let g:airline_section_x=''

" enables coc.nvim extension and shows background processing
let g:airline#extensions#coc#enabled = 1
let g:airline_section_y = "%{get(g:, 'coc_status', '')}"
let g:airline_section_z = '%3p%% %l:%c'
