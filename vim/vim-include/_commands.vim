" Redirect output to a register
" Usage: :Redir <command>
command! -nargs=1 -complete=command Redir redir @a | sil <args> | redir end | echo "Saved to @a"

" Execute the selected text in a shell and insert the output below
" Usage: :ExecuteAndInsertBelow
function! s:ExecuteAndInsertBelow() abort
    let l:selection = join(getline("'<", "'>"), "\n")
    let l:output = system(l:selection)
    call append(line("'>"), '###')
    call append(line("'>"), split(l:output, "\n"))
    call append(line("'>"), '###')
endfunction
command! -range ExecuteAndInsertBelow call s:ExecuteAndInsertBelow()
