" common
iabbr <expr> __time strftime("%Y-%m-%d %H:%M:%S")
iabbr <expr> __file expand('%:p')
iabbr <expr> __name expand('%')
iabbr <expr> __pwd expand('%:p:h')

" python
" - debugging
iabbr __nose import nose.tools; nose.tools.set_trace()
iabbr __pdb import pdb; pdb.set_trace()
iabbr __pprint from pprint import pprint

" vimscript
iabbr __ifdef if !has_key(plugs, 'PLUGIN NAME')<cr>
\  finish<cr>
\<bs>endif
