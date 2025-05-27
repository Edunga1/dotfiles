-- package manager for lsp
require 'mason'.setup {
  PATH = 'append'
}
require 'mason-lspconfig'.setup {
  automatic_installation = false,
  automatic_enable = false,
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
require 'lsp.servers.lua'(ns, lspconfig)
require 'lsp.servers.markdown'(ns, lspconfig)
require 'lsp.servers.kotlin'(ns, lspconfig)
require 'lsp.servers.python'(ns, lspconfig)
require 'lsp.servers.vim'(ns, lspconfig)
require 'lsp.servers.docker'(ns, lspconfig)
require 'lsp.servers.json'(ns, lspconfig)
require 'lsp.servers.bash'(ns, lspconfig)
require 'lsp.servers.rust'(ns, lspconfig)
require 'lsp.servers.gdscript'(ns, lspconfig)

local common = require 'lsp.servers.utils.common'
local modules = {
  'lsp.servers.typescript',
}

for _, module in ipairs(modules) do
  local servers = require(module)
  for _, server in ipairs(servers) do
    -- enable the server
    vim.lsp.enable(server.name)
    -- configure the server
    local config_table = {
      capabilities = common.capabilities,
    }
    if type(server.on_attach) == 'function' then
      config_table.on_attach = function(client, bufnr)
        common.on_attach(client, bufnr)
        server.on_attach(client, bufnr)
      end
    end
    vim.lsp.config(server.name, config_table)
  end
end
