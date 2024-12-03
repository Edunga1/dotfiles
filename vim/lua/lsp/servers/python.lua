local common = require 'lsp.servers.utils.common'

return function(ns, lspconfig)
  lspconfig.pyright.setup {
    on_attach = common.on_attach,
    capabilities = common.capabilities,
  }

  ns.register(ns.builtins.formatting.autopep8)
  ns.register(ns.builtins.formatting.isort)
  ns.register(ns.builtins.formatting.ruff)
  ns.register(ns.builtins.diagnostics.ruff)
end
