local common = require 'lsp.servers.utils.common'

return function(lspconfig)
  lspconfig.jsonls.setup {
    on_attach = common.on_attach,
    capabilities = common.capabilities,
  }
end
