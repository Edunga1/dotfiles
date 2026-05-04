-- source .vimrc
vim.cmd('source ' .. '~/.vimrc')

-- Treesitter
vim.api.nvim_create_autocmd('FileType', {
  callback = function(args)
    pcall(vim.treesitter.start, args.buf)
  end,
})

-- source a LSP initial script.
vim.cmd('runtime ' .. 'lua/lsp/init.lua')
