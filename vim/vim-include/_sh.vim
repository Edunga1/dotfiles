" expand backslash line continuations around cursor
function! s:CurrentLineExpanded() abort
  let l:start = line('.')
  while l:start > 1 && getline(l:start - 1) =~# '\\$'
    let l:start -= 1
  endwhile
  let l:end = l:start
  while l:end < line('$') && getline(l:end) =~# '\\$'
    let l:end += 1
  endwhile
  return join(getline(l:start, l:end), "\n")
endfunction

function! s:FindParagraphEnd(row) abort
  let l:r = a:row
  while l:r <= line('$')
    if getline(l:r) ==# ''
      return l:r - 1
    endif
    let l:r += 1
  endwhile
  return line('$')
endfunction

" :Sh        - run current line (joining \ continuations)
" :5,10Sh    - run lines 5~10
" :'<,'>Sh   - run visual selection
function! s:Run(range_count, line1, line2) abort
  let l:script = a:range_count == 0
        \ ? s:CurrentLineExpanded()
        \ : join(getline(a:line1, a:line2), "\n")
  let l:anchor = a:range_count > 0 ? a:line2 : line('.')
  let l:para_end = s:FindParagraphEnd(l:anchor)
  let l:path = printf('/tmp/run_%s.out', strftime('%Y%m%d_%H%M%S'))

  let l:output = system(['bash', '-c', "(\n" . l:script . "\n) 2>&1"])

  " exit if command not found
  if v:shell_error == 127
    echom 'Sh: ' . trim(l:output)
    return
  endif

  let l:lines = split(l:output, "\n", 1)
  if !empty(l:lines) && l:lines[-1] ==# ''
    call remove(l:lines, -1)
  endif
  call writefile(l:lines, l:path)

  " append result file path to the end of the paragraph
  if l:para_end == line('$')
    call append(l:para_end, ['', '>> ' . l:path])
  else
    call append(l:para_end + 1, ['>> ' . l:path])
  endif
  call cursor(l:para_end + 2, 4)
  echom printf('exit %d → %s', v:shell_error, l:path)
endfunction

command! -range Sh call <SID>Run(<range>, <line1>, <line2>)
