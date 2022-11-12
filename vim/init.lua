-- source .vimrc
vim.cmd('source ' .. '~/.vimrc')

-- python3 provider
vim.g.python3_host_prog = '~/.pyenv/versions/py3nvim/bin/python'

-- source custom lua files
vim.cmd('runtime ' .. 'lua/lsp/init.lua')
