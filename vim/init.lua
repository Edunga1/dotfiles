-- source .vimrc
vim.cmd('source ' .. '~/.vimrc')

-- source a LSP initial script.
vim.cmd('runtime ' .. 'lua/lsp/init.lua')
