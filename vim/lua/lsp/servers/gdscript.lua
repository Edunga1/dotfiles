local common = require 'lsp.servers.utils.common'

return function(_, lspconfig)
  lspconfig.gdscript.setup {
    on_attach = common.on_attach,
    capabilities = common.capabilities,
  }
end
