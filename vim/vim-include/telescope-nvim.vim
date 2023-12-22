if !has_key(plugs, 'telescope.nvim')
  finish
endif

nnoremap <space>o <cmd>Telescope lsp_document_symbols<cr>
nnoremap <space>s <cmd>Telescope lsp_dynamic_workspace_symbols<cr>
