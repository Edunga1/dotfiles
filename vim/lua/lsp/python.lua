local common = require 'lsp._common'

require 'lspconfig'.pyright.setup {
  on_attach = common.on_attach,
  capabilities = common.capabilities,
}

local null_ls = require 'null-ls'
null_ls.setup {
  sources = {
    null_ls.builtins.diagnostics.pylint,
    null_ls.builtins.diagnostics.mypy.with {
      extra_args = { '--ignore-missing-imports' }
    },
    null_ls.builtins.formatting.autopep8,
    null_ls.builtins.formatting.isort,
  },
}
