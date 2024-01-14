local common = require 'lsp._common'

return function(_, lspconfig)
  lspconfig.rust_analyzer.setup {
    on_attach = common.on_attach,
    capabilities = common.capabilities,
  }
end
