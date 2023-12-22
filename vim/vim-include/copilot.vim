if !has_key(plugs, 'copilot.vim')
  finish
endif

" <c-j> to accept completion instead of <tab>
imap <silent><script><expr> <C-J> copilot#Accept("\<CR>")
let g:copilot_no_tab_map = v:true

" copilot enabled status for specific filetypes
let g:copilot_filetypes = {
  \ 'markdown': v:true,
  \ 'yaml': v:true,
  \ 'gitcommit': v:true,
  \ }
