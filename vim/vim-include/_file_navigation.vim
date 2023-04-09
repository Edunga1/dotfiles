function! NavigateTestFile()
  let filename = expand("%")
  let dirname = fnamemodify(filename, ":h")
  let basename = fnamemodify(filename, ":t:r")
  let extension = fnamemodify(filename, ":e")
  let testfile = substitute(basename, "_test$", "", "")
  let testfile = substitute(testfile, "Test$", "", "")
  let testfile = testfile."_test." . extension
  let testpath = dirname . '/' . testfile
  let result = system("find ". shellescape(dirname) . " -name ". shellescape(testfile))
  if result == ""
    echo "Test file not found."
  else
    let lines = split(result, '\n')
    let quickfix_list = []
    for line in lines
      if line != ""
        call add(quickfix_list, {'filename': line})
      endif
    endfor
    call setqflist(quickfix_list)
    copen | cc
  endif
endfunction

nnoremap g1 :call NavigateTestFile()<CR>
