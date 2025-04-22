local common = require 'lsp.servers.utils.common'

return function(ns, lspconfig)
  lspconfig.pyright.setup {
    on_attach = common.on_attach,
    capabilities = common.capabilities,
  }

  ns.register(require('none-ls.formatting.autopep8'))
  ns.register(ns.builtins.formatting.isort)
  ns.register(require('none-ls.formatting.ruff'))
  ns.register(require('none-ls.diagnostics.ruff'))
end
