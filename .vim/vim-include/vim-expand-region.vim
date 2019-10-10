" terryma/vim-expand-region

" too slow if all objects are enabled. so enables only a few modules.
call expand_region#custom_text_objects('python', {
  \ 'af' :1,
  \ 'if' :1,
  \ 'ac' :1,
  \ 'ic' :1,
  \ })
