if match(&runtimepath, '/sonokai') == -1
  finish
endif

if has('termguicolors')
  set termguicolors
endif

let g:sonokai_style = 'andromeda'
let g:sonokai_better_performance = 1
colo sonokai
