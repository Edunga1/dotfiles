if !has_key(plugs, 'sonokai')
  finish
endif

if has('termguicolors')
  set termguicolors
endif

let g:sonokai_style = 'andromeda'
let g:sonokai_better_performance = 1

function! s:sonokai_custom() abort
  let l:palette = sonokai#get_palette('andromeda', {})
  call sonokai#highlight('Visual', l:palette.none, l:palette.bg4)
endfunction

augroup SonokaiCustom
  autocmd!
  autocmd ColorScheme sonokai call s:sonokai_custom()
augroup END
