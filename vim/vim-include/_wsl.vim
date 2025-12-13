" setting for wsl2

" === PASS IF SYSTEM IS NOT RUNNING ON WSL
function! s:IsWSL()
  if has("unix") && filereadable("/proc/version")
    let lines = readfile("/proc/version")
    if lines[0] =~ "Microsoft"
      return 1
    endif
  endif
  return 0
endfunction

if !s:IsWSL()
  finish
endif
" ===


" windows clipboard sharing
" - OP: https://github.com/microsoft/WSL/issues/4440#issuecomment-638956838
let g:clipboard = {
          \   'name': 'win32yank-wsl',
          \   'copy': {
          \      '+': 'win32yank.exe -i --crlf',
          \      '*': 'win32yank.exe -i --crlf',
          \    },
          \   'paste': {
          \      '+': 'win32yank.exe -o --lf',
          \      '*': 'win32yank.exe -o --lf',
          \   },
          \   'cache_enabled': 0,
          \ }


" Clipboard image pasting(WIP)
" Usage: :call PasteImageFromClipboard('sample.png')
let s:img_paste_cmd = 'powershell.exe -NoProfile -Command "(Get-Clipboard -Format Image).Save(' . "'$(wslpath -w %s)'" . ')" && ls -lh %s || echo "No image in clipboard"'
function! PasteImageFromClipboard(img_path) abort
  let l:cmd = printf(s:img_paste_cmd, a:img_path, a:img_path)
  call system(l:cmd)
  if v:shell_error
    echo "No image in clipboard"
    return 0
  endif
  return 1
endfunction
