function! SaveImageFromClipboard(abs_path) abort
  if empty(a:abs_path)
    echoerr 'path must not be empty'
  endif

  if IsMac()
    let l:result = MacSaveImageFromClipboard(a:abs_path)
  elseif IsWSL()
    let l:result = WSLSaveImageFromClipboard(a:abs_path)
  else
    echoerr 'No clipboard function for this environment.'
  endif

  if !l:result
    echoerr 'save failed'
  endif

  return a:abs_path
endfunction

function! PasteImagePrompt(...) abort
  let l:default = expand('%:.:h') . '/sample.png'
  let l:img_path = a:0 > 0 ? join(a:000) : input('path? ', l:default)

  if empty(l:img_path)
    return ''
  endif

  if l:img_path !~ '\.png$'
    let l:img_path .= '.png'
  endif

  return SaveImageFromClipboard(fnamemodify(l:img_path, ':p'))
endfunction

command! -nargs=? PasteImage call PasteImagePrompt(<f-args>)
