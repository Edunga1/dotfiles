" abbreviations

" common
iabbr <expr> __time strftime("%Y-%m-%d %H:%M:%S")
iabbr <expr> __file expand('%:p')
iabbr <expr> __name expand('%')
iabbr <expr> __pwd expand('%:p:h')

" python
iabbr __nose from pprint import pprint; import nose.tools; nose.tools.set_trace()
iabbr __pdb from pprint import pprint; import pdb; pdb.set_trace()
