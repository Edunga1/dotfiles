local common = require 'lsp._common'

require 'lspconfig'.marksman.setup {
  on_attach = common.on_attach,
  capabilities = common.capabilities,
}
