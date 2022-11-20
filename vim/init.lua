-- source .vimrc
vim.cmd('source ' .. '~/.vimrc')

-- python3 provider
vim.g.python3_host_prog = '~/.pyenv/versions/py3nvim/bin/python'

-- source a LSP initial script.
vim.cmd('runtime ' .. 'lua/lsp/init.lua')

-- source custom scripts coded in lua.
vim.cmd('runtime! ' .. 'lua/vim-include/**/*.lua')
