if !has_key(plugs, 'fzf.vim')
  finish
endif

" ctrl-p: gitignore respected
nnoremap <silent> <C-p> :call fzf#vim#files('', {'dir': getcwd(), 'source': 'rg --files --hidden'})<CR>

" ctrl-\: gitignore not respected
nnoremap <silent> <C-\> :call fzf#vim#files('', {'dir': getcwd(), 'source': 'rg --files --hidden --no-ignore-vcs'})<CR>

" [[B]Commits] Customize the options used by 'git log':
let g:fzf_commits_log_options = '--graph --color=always --format="%C(auto)%h%d %s %C(black)%C(bold)%cr"'

" :GDiff <commit> to print names of changed files
command! -bang -complete=dir -nargs=* GDIff
  \ call fzf#run(
    \ fzf#vim#with_preview({
      \ 'source': 'git diff --name-only '.(<q-args> == '' ? 'HEAD~1' : <q-args>),
      \ 'sink': 'e'
    \ }), <bang>0)

command! -bang -nargs=* Rg call fzf#vim#grep("rg --column --line-number --no-heading --color=always --smart-case ".shellescape(<q-args>), 1, {'options': '--delimiter : --nth 4..'}, <bang>0)

vnoremap <leader>s "ty:Rg <C-r>t<CR>
nnoremap <M-p> :Commands<CR>
