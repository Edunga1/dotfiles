" git wrapper

" GdiffRev
" e.g.)
" :GdiffRev
" :GdiffRev master
let s:git_status_dictionary = {
    \ "A": "Added",
    \ "B": "Broken",
    \ "C": "Copied",
    \ "D": "Deleted",
    \ "M": "Modified",
    \ "R": "Renamed",
    \ "T": "Changed",
    \ "U": "Unmerged",
    \ "X": "Unknown"
    \ }

function! s:get_diff_files(...)
  let rev = a:1 == '' ? 'HEAD~1' : a:1
  let list = map(split(system(
    \ 'git diff --name-status '.rev), '\n'),
    \ '{"filename":matchstr(v:val, "\\S\\+$"),"text":s:git_status_dictionary[matchstr(v:val, "^\\w")]}'
    \ )
  call setqflist(list)
  copen
endfunction

command! -nargs=* GdiffRev call s:get_diff_files(<q-args>)
