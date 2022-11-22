local null_ls = require 'null-ls'
return {
    server = require 'lspconfig'.pyright,
    sources = {
        null_ls.builtins.diagnostics.pylint,
        null_ls.builtins.diagnostics.mypy.with {
            extra_args = { '--ignore-missing-imports' }
        },
        null_ls.builtins.formatting.autopep8,
        null_ls.builtins.formatting.isort,
    },
}
