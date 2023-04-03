local common = require 'lsp._common'

require 'lspconfig'.kotlin_language_server.setup {
  on_attach = common.on_attach,
  capabilities = common.capabilities,
}

local null_ls = require 'null-ls'
null_ls.setup {
  sources = {
    null_ls.builtins.diagnostics.ktlint,
    null_ls.builtins.formatting.ktlint,
  },
}
