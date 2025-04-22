-- package manager for lsp
require 'mason'.setup {
  PATH = 'append'
}
require 'mason-lspconfig'.setup {
  automatic_installation = false,
}

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
local lspconfig = require 'lspconfig'
require 'lsp.servers.lua'(lspconfig)
require 'lsp.servers.markdown'(lspconfig)
require 'lsp.servers.kotlin'(lspconfig)
require 'lsp.servers.python'(lspconfig)
require 'lsp.servers.typescript'(lspconfig)
require 'lsp.servers.vim'(lspconfig)
require 'lsp.servers.docker'(lspconfig)
require 'lsp.servers.json'(lspconfig)
require 'lsp.servers.bash'(lspconfig)
require 'lsp.servers.rust'(lspconfig)
require 'lsp.servers.gdscript'(lspconfig)
