" common
iabbr <expr> __date strftime("%Y-%m-%d")
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
iabbr __ifdef if !has_key(plugs, 'PLUGIN_NAME')<cr>
\finish<cr>
\<bs>endif<cr>

" yaml
iabbr <buffer> __compose <C-o>:set paste<cr>services:<cr>
\  app:<cr>
\    image: alpine:latest<cr>
\    command: ls -al<cr>
\    ports:<cr>
\      - "3000:3000"<cr>
\    volumes:<cr>
\      - ./:/app<cr>
\    environment:<cr>
\      APP_ENV: development<C-o>:set nopaste<cr>
