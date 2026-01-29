if !has_key(plugs, 'vim-gitgutter')
  finish
endif

nmap ]h <Plug>(GitGutterNextHunk)
nmap [h <Plug>(GitGutterPrevHunk)
nmap \h <cmd>GitGutterQuickFixCurrentFile<cr><cmd>copen<cr>
nmap <M-d> <Plug>(GitGutterPreviewHunk)
