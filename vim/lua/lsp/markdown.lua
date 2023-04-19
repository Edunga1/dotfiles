local common = require 'lsp._common'

return function(_, lspconfig)
  lspconfig.marksman.setup {
    on_attach = common.on_attach,
    capabilities = common.capabilities,
  }
end
