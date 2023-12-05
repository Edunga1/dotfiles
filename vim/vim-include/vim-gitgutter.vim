if !has_key(plugs, 'vim-gitgutter')
  finish
endif

nmap ]h <Plug>(GitGutterNextHunk)
nmap [h <Plug>(GitGutterPrevHunk)
