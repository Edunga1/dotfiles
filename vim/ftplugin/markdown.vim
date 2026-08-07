if exists('b:loaded_ftplugin_markdown')
  finish
endif
let b:loaded_ftplugin_markdown = 1

function! s:GetFrontmatterEndLineNum(...) abort
  let max_lines = a:0 ? a:0 : 20
  let lines = getline(1, max_lines)
  let i = 1
  let found = 0
  for line in lines
    if line =~ '^---'
      if found
        return i
      endif
      let found = 1
    endif
    let i += 1
  endfor

  return -1
endfunction

function! s:HasFrontmatter()
  return s:GetFrontmatterEndLineNum() != -1
endfunction

function! s:CreateFrontmatter()
  if s:HasFrontmatter()
    return
  endif
  call append(0, "---")
  call append(1, "---")
endfunction

function! s:AddFrontmatter(...)
  let key = get(a:, 1, '')
  let value = get(a:, 2, '')
  call s:CreateFrontmatter()
  let line_num = s:GetFrontmatterEndLineNum() - 1
  call append(line_num, key . ": " . value)
  call cursor(line_num + 1, col('$'))
  startinsert!
endfunction

function! s:ApplyTitle(bufnr, url, job_id, data, event) abort
  let html = join(a:data, "\n")
  let m = matchlist(html, '<meta[^>]\{-}property=["'']og:title["''][^>]\{-}content=["'']\([^"'']\+\)')
  if empty(m)
    let m = matchlist(html, '<meta[^>]\{-}content=["'']\([^"'']\+\)["''][^>]\{-}property=["'']og:title')
  endif
  if empty(m)
    let m = matchlist(html, '<title[^>]*>\s*\(\_.\{-}\)\s*</title>')
  endif
  let title = empty(m) ? '' : substitute(m[1], '\s\+', ' ', 'g')
  if title ==# '' || !bufloaded(a:bufnr)
    return
  endif
  for [entity, char] in [['&lt;', '<'], ['&gt;', '>'], ['&quot;', '"'], ['&#39;', "'"], ['&nbsp;', ' '], ['&amp;', '\&']]
    let title = substitute(title, entity, char, 'g')
  endfor
  let title = substitute(title, '[\[\]]', '\\&', 'g')
  let lines = getbufline(a:bufnr, 1, '$')
  for lnum in range(1, len(lines))
    let idx = stridx(lines[lnum - 1], a:url)
    " skip urls already inside a markdown link
    if idx >= 0 && strpart(lines[lnum - 1], idx - 1, 1) !=# '('
      let link = '[' . title . '](' . a:url . ')'
      let pattern = '\V' . escape(a:url, '\')
      call setbufline(a:bufnr, lnum, substitute(lines[lnum - 1], pattern, escape(link, '&\'), ''))
      return
    endif
  endfor
endfunction

function! s:PasteUrl() abort
  let text = trim(getreg('+'))
  if text !~? '^https\?://\S\+$' || !exists('*jobstart')
    normal! "+p
    return
  endif
  call nvim_put([text], 'c', v:true, v:true)
  call jobstart(
        \ ['curl', '-sL', '--max-time', '3', '-A', 'Mozilla/5.0', text],
        \ {'stdout_buffered': v:true, 'on_stdout': function('s:ApplyTitle', [bufnr(), text])},
        \ )
endfunction

command! -buffer FrontmatterCreate call s:CreateFrontmatter()
command! -buffer -nargs=* FrontmatterAdd call s:AddFrontmatter(<f-args>)

" URL pasting with title from meta tags
command! -buffer PasteUrl call s:PasteUrl()
nnoremap <buffer><silent> <leader>p :call <SID>PasteUrl()<CR>
