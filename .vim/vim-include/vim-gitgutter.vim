" to fix sign column issue:
" https://github.com/airblade/vim-gitgutter/issues/696
highlight! link SignColumn LineNr

augroup git_gutter_config
  autocmd!
  au VimEnter * GitGutterSignsDisable
  au VimEnter * GitGutterLineNrHighlightsEnable
  au VimEnter * highlight GitGutterAddLineNr ctermfg=lightgreen
  au VimEnter * highlight GitGutterChangeLineNr ctermfg=lightblue
  au VimEnter * highlight GitGutterDeleteLineNr ctermfg=lightred
  au VimEnter * highlight GitGutterChangeDeleteLineNr ctermfg=lightred
augroup END

nmap ]h <Plug>(GitGutterNextHunk)
nmap [h <Plug>(GitGutterPrevHunk)
