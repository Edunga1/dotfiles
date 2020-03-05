" personal wiki path
let g:vimwiki_list = [
    \{
    \   'path': '~/workspace/cat-logic/docs',
    \   'ext' : '.md',
    \   'syntax' : 'markdown',
    \   'diary_rel_path': '.',
    \},
    \{
    \   'path': '~/workspace/personal-wiki/docs',
    \   'ext' : '.md',
    \   'diary_rel_path': '.',
    \   'syntax' : 'markdown',
    \   'auto_toc':1,
    \},
\]

" disable conceallevel
let g:vimwiki_conceallevel = 0

" Look for a word on cursor in wiki
nnoremap <leader>wf :execute "VWS /" . expand("<cword>") . "/" <Bar> :lopen<CR>

" Look for wikis that references current wiki
nnoremap <leader>wb :execute "VWB" <Bar> :lopen<CR>
