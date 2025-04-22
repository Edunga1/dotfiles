local common = require 'lsp.servers.utils.common'

return function(lspconfig)
  lspconfig.pyright.setup {
    on_attach = common.on_attach,
    capabilities = common.capabilities,
  }
  -- TODO: autopep8, isort, ruff
end
