" scrooloose/syntastic

let g:syntastic_python_checkers = ['pylint']
let g:syntastic_mode_map = { 'mode': 'passive', 'active_filetypes': [], 'passive_filetypes': [] }
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_python_pylint_args = '--disable=C0111'

map <Leader>c :SyntasticCheck<CR>
map <Leader>C :SyntasticReset<CR>
