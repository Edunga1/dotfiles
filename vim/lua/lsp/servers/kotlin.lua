local common = require 'lsp.servers.utils.common'

return function(lspconfig)
  lspconfig.kotlin_language_server.setup {
    on_attach = common.on_attach,
    capabilities = common.capabilities,
  }
  -- TODO: ktlint
end
