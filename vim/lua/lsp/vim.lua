local common = require 'lsp._common'

return function(_, lspconfig)
  lspconfig.vimls.setup {
    on_attach = common.on_attach,
    capabilities = common.capabilities,
  }
end
