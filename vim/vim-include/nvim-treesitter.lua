vim.api.nvim_create_autocmd('FileType', {
  pattern = { 'typescriptreact', 'javascriptreact' },
  callback = function()
    vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
  end,
})
