if !has_key(plugs, 'vim-gitgutter')
  finish
endif

nmap ]h <Plug>(GitGutterNextHunk)
nmap [h <Plug>(GitGutterPrevHunk)
nmap \h <cmd>GitGutterQuickFixCurrentFile<cr><cmd>copen<cr>
nnoremap <silent> <M-d> <cmd>lua if #vim.diagnostic.get(0, {lnum = vim.fn.line('.') - 1}) > 0 then vim.diagnostic.open_float() else vim.cmd('GitGutterPreviewHunk') end<cr>
nmap <M-u> <Plug>(GitGutterUndoHunk)
