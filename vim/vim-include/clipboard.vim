function! PasteImagePrompt(...) abort
  let l:default = expand('%:.:h') . '/sample.png'
  let l:img_path = a:0 > 0 ? join(a:000) : input('path? ', l:default)

  if empty(l:img_path)
    return ''
  endif

  if l:img_path !~ '\.png$'
    let l:img_path .= '.png'
  endif

  let l:img_path = fnamemodify(l:img_path, ':p')

  if IsMac()
    let l:result = MacSaveImageFromClipboard(l:img_path)
  elseif IsWSL()
    let l:result = WSLSaveImageFromClipboard(l:img_path)
  else
    echoerr 'No clipboard function for this environment.'
    return ''
  endif

  if l:result
    return l:img_path
  endif
  return ''
endfunction

command! -nargs=? PasteImage call PasteImagePrompt(<f-args>)
