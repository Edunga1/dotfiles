" setting for macOS

function! IsMac()
  return has('mac')
endfunction

" === PASS IF SYSTEM IS NOT RUNNING ON macOS
if !IsMac()
  finish
endif
" ===


" Clipboard image pasting
" Usage: :call MacSaveImageFromClipboard('sample.png')
function! MacSaveImageFromClipboard(img_path) abort
  let l:cmd = "osascript -e 'the clipboard as «class PNGf»'"
        \ . " | sed 's/«data PNGf//;s/»//'"
        \ . ' | xxd -r -p > ' . shellescape(a:img_path)
  call system(l:cmd)
  return v:shell_error == 0
endfunction
