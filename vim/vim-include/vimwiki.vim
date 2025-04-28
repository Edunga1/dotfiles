if !has_key(plugs, 'vimwiki')
  finish
endif

let g:vimwiki_conceallevel = 0
let g:vimwiki_global_ext = 0
let g:vimwiki_markdown_link_ext = 1

" Add the code below to .vimrc.local to recognize the wiki directory
"let g:vimwiki_list = [
"    \{
"    \   'path': '~/some/path/to/wiki',
"    \   'syntax': 'markdown',
"    \   'ext' : '.md',
"    \   'diary_rel_path': '.',
"    \}
"\]
