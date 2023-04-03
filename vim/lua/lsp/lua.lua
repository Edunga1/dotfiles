local common = require 'lsp._common'

require 'lspconfig'.lua_ls.setup {
  on_attach = common.on_attach,
  capabilities = common.capabilities,
}
