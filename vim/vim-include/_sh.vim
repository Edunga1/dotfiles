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

function! s:Run(bang, range_count, line1, line2) abort
  if a:bang
    if !exists('s:last')
      echom 'Sh: no previous run'
      return
    endif
    let [l:script, l:anchor] = [s:last.script, s:last.anchor]
  elseif a:range_count == 0
    let l:script = s:CurrentLineExpanded()
    let l:anchor = line('.')
  else
    let l:script = join(getline(a:line1, a:line2), "\n")
    let l:anchor = a:line2
  endif
  let s:last = {'script': l:script, 'anchor': l:anchor}
  let l:para_end = s:FindParagraphEnd(l:anchor)

  let l:t0 = reltime()
  let l:output = system(['bash', '-c', "(\n" . l:script . "\n) 2>&1"])
  let l:elapsed = reltimefloat(reltime(l:t0))

  " exit if command not found
  if v:shell_error == 127
    echom 'Sh: ' . trim(l:output)
    return
  endif

  let l:path = printf('/tmp/run_%s.%d.out', strftime('%Y%m%d_%H%M%S'), v:shell_error)
  let l:lines = split(l:output, "\n", 1)
  if !empty(l:lines) && l:lines[-1] ==# ''
    call remove(l:lines, -1)
  endif
  call writefile(l:lines, l:path)

  " append result file path to the end of the paragraph
  let l:summary = v:shell_error == 0
        \ ? printf('>> %s (%.2fs)', l:path, l:elapsed)
        \ : printf('>> %s', l:path)
  if l:para_end == line('$')
    call append(l:para_end, ['', l:summary])
  else
    call append(l:para_end + 1, [l:summary])
  endif
  call cursor(l:para_end + 2, 4)
  echom printf('exit %d → %s', v:shell_error, l:path)
endfunction

" :Sh        - run current line (joining \ continuations)
" :5,10Sh    - run lines 5~10
" :'<,'>Sh   - run visual selection
" :Sh!       - re-run the last execution
" output saved to /tmp/run_<timestamp>.<exit>.out, path appended to the paragraph
command! -range -bang Sh call <SID>Run(<bang>0, <range>, <line1>, <line2>)
