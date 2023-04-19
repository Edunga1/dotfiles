local common = require 'lsp._common'

return function(ns, lspconfig)
  lspconfig.kotlin_language_server.setup {
    on_attach = common.on_attach,
    capabilities = common.capabilities,
  }

  ns.register(ns.builtins.diagnostics.ktlint)
  ns.register(ns.builtins.formatting.ktlint)
end
