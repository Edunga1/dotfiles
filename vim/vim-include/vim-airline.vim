" vim-airline-themes
let g:airline_theme = 'solarized'

" hide filetype (section x)
let g:airline_section_x = ''

" shorten cursor info on file
let g:airline_section_z = '%3p%% %l:%c'

let g:airline_section_y = "%{get(g:, 'coc_status', '')}"
let g:airline#extensions#coc#enabled = 0
