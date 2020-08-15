" List git files if git project. or just list files
nnoremap <expr> <C-p> (len(system('git rev-parse')) ? ':Files' : ':GFiles --exclude-standard --others --cached')."\<cr>"

" [[B]Commits] Customize the options used by 'git log':
let g:fzf_commits_log_options = '--graph --color=always --format="%C(auto)%h%d %s %C(black)%C(bold)%cr"'

" Git diff
command! -bang -complete=dir -nargs=* GDiff
  \ call fzf#run(
    \ fzf#vim#with_preview({
      \ 'source': 'git diff --name-only '.<q-args>,
      \ 'sink': 'e'
    \ }), <bang>0)
