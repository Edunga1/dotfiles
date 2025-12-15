function! PasteImagePrompt(...) abort
  let l:img_path = a:0 > 0 ? join(a:000) : input('path? ', 'sample.png')

  if l:img_path !~ '\.png$'
    let l:img_path .= '.png'
  endif

  if IsWSL()
    return WSLSaveImageFromClipboard(l:img_path)
  endif

  " TODO: Add support for macOS
  echoerr "No clipboard function for non-WSL environment."
  return 0
endfunction

command! -nargs=? PasteImage call PasteImagePrompt(<f-args>)
