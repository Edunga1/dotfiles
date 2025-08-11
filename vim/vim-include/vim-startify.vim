if !has_key(plugs, 'vim-startify')
  finish
endif

let g:startify_change_to_vcs_root = 1

" Use NERDTree bookmarks
let g:startify_bookmarks = systemlist("cut -sd' ' -f 2- ~/.NERDTreeBookmarks")

" Rearrange lists
function s:sessions()
  let path = stdpath('data') . "/sessions/"
  let sessions = systemlist('ls '.path)
  return map(sessions, '{
        \ "line": substitute(v:val, "%2F", "/", "g"),
        \ "cmd": "SessionRestore " . substitute(v:val, ".vim$", "", "")
        \ }')
endfunction

let g:startify_lists = [
  \ { 'type': function('s:sessions'), 'header': ['   Sessions - '.stdpath('data').'/sessions'] },
  \ { 'type': 'files',     'header': ['   MRU']            },
  \ { 'type': 'dir',       'header': ['   MRU '. getcwd()] },
  \ { 'type': 'bookmarks', 'header': ['   Bookmarks']      },
  \ { 'type': 'commands',  'header': ['   Commands']       },
  \ ]

