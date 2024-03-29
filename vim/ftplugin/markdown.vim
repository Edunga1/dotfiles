if exists('g:loaded_ftplugin_markdown')
  finish
endif
let g:loaded_ftplugin_markdown = 1

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

command! FrontmatterCreate call s:CreateFrontmatter()
command! -nargs=* FrontmatterAdd call s:AddFrontmatter(<f-args>)
