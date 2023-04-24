-- source .vimrc
vim.cmd('source ' .. '~/.vimrc')

-- source a LSP initial script.
vim.cmd('runtime ' .. 'lua/lsp/init.lua')

-- source custom scripts coded in lua.
vim.cmd('runtime! ' .. 'lua/vim-include/**/*.lua')
