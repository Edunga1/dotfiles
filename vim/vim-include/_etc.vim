" Redirect output to a register
" Usage: :Redir <command>
command! -nargs=1 -complete=command Redir redir @a | sil <args> | redir end | echo "Saved to @a"
