" personal wiki path
let g:vimwiki_list = [
    \{
    \   'path': '~/workspace/cat-logic/docs',
    \   'ext' : '.md',
    \   'diary_rel_path': '.',
    \},
    \{
    \   'path': '~/workspace/personal-wiki/docs',
    \   'ext' : '.md',
    \   'diary_rel_path': '.',
    \},
\]

" disable conceallevel
let g:vimwiki_conceallevel = 0

" shortcuts
command! WikiIndex :VimwikiIndex
nmap <LocalLeader>ww <Plug>VimwikiIndex
nmap <LocalLeader>wi <Plug>VimwikiDiaryIndex
nmap <LocalLeader>w<LocalLeader>w <Plug>VimwikiMakeDiaryNote
nmap <LocalLeader>wt :VimwikiTable<CR>
