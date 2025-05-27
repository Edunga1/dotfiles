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
  local server_module = require(module)

  -- Enable nvim-lspconfig servers
  for i, server in ipairs(server_module.servers or {}) do
    local config_table = {
      capabilities = common.capabilities,
    }

    if i == 1 then
      -- Attach common on_attach function
      config_table.on_attach = function(client, bufnr)
        common.on_attach(client, bufnr)
        if type(server.on_attach) == 'function' then
          server.on_attach(client, bufnr)
        end
      end
    elseif type(server.on_attach) == 'function' then
      -- Otherwise, use the server's own on_attach function
      config_table.on_attach = server.on_attach
    end

    vim.lsp.enable(server[1])
    vim.lsp.config(server[1], config_table)
  end

  -- Register none-ls sources
  if type(server_module.get_sources) == 'function' then
    ns.register(server_module.get_sources(ns))
  end
end
