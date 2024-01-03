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
local ns = require 'null-ls'
local lspconfig = require 'lspconfig'
ns.setup()
require 'lsp.lua'(ns, lspconfig)
require 'lsp.markdown'(ns, lspconfig)
require 'lsp.kotlin'(ns, lspconfig)
require 'lsp.python'(ns, lspconfig)
require 'lsp.typescript'(ns, lspconfig)
require 'lsp.vim'(ns, lspconfig)
require 'lsp.docker'(ns, lspconfig)
require 'lsp.json'(ns, lspconfig)
require 'lsp.bash'(ns, lspconfig)
