-- package manager for lsp
require 'mason'.setup{
  PATH = 'append'
}
require 'mason-lspconfig'.setup()

-- setup key mappings
vim.diagnostic.config({
  float = {
    source = true,
  },
})
local opts = { noremap = true, silent = true }
vim.keymap.set('n', '<space>e', vim.diagnostic.open_float, opts)
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, opts)
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, opts)
vim.keymap.set('n', '\\d', vim.diagnostic.setloclist, opts)

-- setup language servers
require 'lsp.kotlin'
require 'lsp.lua'
require 'lsp.typescript'
require 'lsp.python'
require 'lsp.markdown'
