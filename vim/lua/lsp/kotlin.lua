local null_ls = require 'null-ls'
local common = require 'lsp._common'

require 'lspconfig'.kotlin_language_server.setup {
  on_attach = common.on_attach,
  capabilities = common.capabilities,
}

return {
  sources = {
    null_ls.builtins.diagnostics.ktlint,
    null_ls.builtins.formatting.ktlint,
  },
}
