local common = require 'lsp._common'

return function(ns, lspconfig)
  lspconfig.pyright.setup {
    on_attach = common.on_attach,
    capabilities = common.capabilities,
  }

  ns.register(ns.builtins.formatting.autopep8)
  ns.register(ns.builtins.formatting.isort)
  ns.register(ns.builtins.diagnostics.pylint)
  ns.register(ns.builtins.diagnostics.mypy.with {
    extra_args = { '--ignore-missing-imports' }
  })
end
