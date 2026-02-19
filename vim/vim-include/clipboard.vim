function! PasteImagePrompt(...) abort
  let l:img_path = a:0 > 0 ? join(a:000) : input('path? ', 'sample.png')

  if l:img_path !~ '\.png$'
    let l:img_path .= '.png'
  endif

  " Resolve relative path from current file's directory
  if l:img_path !~ '^/'
    let l:img_path = expand('%:p:h') . '/' . l:img_path
  endif

  if IsMac()
    let l:result = MacSaveImageFromClipboard(l:img_path)
  elseif IsWSL()
    let l:result = WSLSaveImageFromClipboard(l:img_path)
  else
    echoerr 'No clipboard function for this environment.'
    return 0
  endif

  return l:result
endfunction

command! -nargs=? PasteImage call PasteImagePrompt(<f-args>)
