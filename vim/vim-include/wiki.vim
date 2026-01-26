if !has_key(plugs, 'wiki.vim')
  finish
endif

" This fixes the issue of opening links on macOS by using the 'open' command.
" This is no longer needed if Neovim is updated to 0.12.0 or later.
" https://github.com/lervag/wiki.vim/issues/416
function! WikiOpenBrowser(url, ...) abort
  let l:cmd = 'open ' . shellescape(a:url.url) . ' &'
  call system(l:cmd)
endfunction

let g:wiki_link_schemes = {
      \ 'https': {'handler': function('WikiOpenBrowser')},
      \ 'http': {'handler': function('WikiOpenBrowser')},
      \}
